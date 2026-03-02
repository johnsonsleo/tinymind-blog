class BoostPython3AT1760 < Formula
  desc "C++ library for C++/Python3 interoperability"
  homepage "https://www.boost.org/"
  # Please add to synced_versions_formulae.json once version synced with boost
  url "https://archives.boost.io/release/1.76.0/source/boost_1_76_0.tar.bz2"
  sha256 "f0397ba6e982c4450f27bf32a2a83292aba035b827a5623a14636ea583318c41"
  license "BSL-1.0"
  head "https://github.com/boostorg/boost.git", branch: "master"

  livecheck do
    formula "boost"
  end

  depends_on "boost@1.76.0"
  depends_on "python@3.14"

  def install
    # "layout" should be synchronized with boost
    args = %W[
      -d2
      -j#{ENV.make_jobs}
      --layout=tagged-1.66
      --user-config=user-config.jam
      install
      threading=multi,single
      link=shared,static
    ]

    # Boost is using "clang++ -x c" to select C compiler which breaks C++14
    # handling using ENV.cxx14. Using "cxxflags" and "linkflags" still works.
    args << "cxxflags=-std=c++14 -Wno-enum-constexpr-conversion"
    args << "cxxflags=-stdlib=libc++" << "linkflags=-stdlib=libc++" if ENV.compiler == :clang

    # disable python detection in bootstrap.sh; it guesses the wrong include
    # directory for Python 3 headers, so we configure python manually in
    # user-config.jam below.
    inreplace "bootstrap.sh", "using python", "#using python"

    # Python 3.14 rejects GC-flagged types without a traverse function.
    # Boost 1.76 enum type sets Py_TPFLAGS_HAVE_GC but tp_traverse is null.
    inreplace "libs/python/src/object/enum.cpp", /\s*\| Py_TPFLAGS_HAVE_GC\n/, "\n"

    pyver = Language::Python.major_minor_version Formula["python@3.14"].opt_bin/"python3"
    py_prefix = Formula["python@3.14"].opt_frameworks/"Python.framework/Versions/#{pyver}"
    py_prefix = Formula["python@3.14"].opt_prefix if OS.linux?

    # Force boost to compile with the desired compiler
    compiler_text = if OS.mac?
      "using darwin : : #{ENV.cxx} ;"
    else
      "using gcc : : #{ENV.cxx} ;"
    end
    (buildpath/"user-config.jam").write <<~EOS
      #{compiler_text}
      using python : #{pyver}
                   : python3.14
                   : #{py_prefix}/include/python#{pyver}
                   : #{py_prefix}/lib ;
    EOS

    system "./bootstrap.sh", "--prefix=#{prefix}", "--libdir=#{lib}",
                             "--with-libraries=python", "--with-python=python3.14",
                             "--with-python-root=#{py_prefix}"

    system "./b2", "--build-dir=build-python3",
                   "--stagedir=stage-python3",
                   "--libdir=install-python3/lib",
                   "--prefix=install-python3",
                   "python=#{pyver}",
                   *args

    lib.install Dir["install-python3/lib/*.*"]
    (lib/"cmake").install Dir["install-python3/lib/cmake/boost_python*"]
    (lib/"cmake").install Dir["install-python3/lib/cmake/boost_numpy*"]
    doc.install Dir["libs/python/doc/*"]
  end

  test do
    (testpath/"hello.cpp").write <<~EOS
      #include <boost/python.hpp>
      char const* greet() {
        return "Hello, world!";
      }
      BOOST_PYTHON_MODULE(hello)
      {
        boost::python::def("greet", greet);
      }
    EOS

    pyincludes = shell_output("#{Formula["python@3.14"].opt_bin}/python3.14-config --includes").chomp.split
    pylib = shell_output("#{Formula["python@3.14"].opt_bin}/python3.14-config --ldflags --embed").chomp.split
    pyver = Language::Python.major_minor_version(Formula["python@3.14"].opt_bin/"python3").to_s.delete(".")

    system ENV.cxx, "-shared", "-fPIC", "hello.cpp", "-L#{lib}", "-lboost_python#{pyver}", "-o",
           "hello.so", *pyincludes, *pylib

    output = <<~EOS
      import hello
      print(hello.greet())
    EOS
    assert_match "Hello, world!", pipe_output(Formula["python@3.14"].opt_bin/"python3", output, 0)
  end
end
