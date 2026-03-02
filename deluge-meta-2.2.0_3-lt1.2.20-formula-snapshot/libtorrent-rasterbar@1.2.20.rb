class LibtorrentRasterbarAT1220 < Formula
  desc "C++ bittorrent library with Python bindings"
  homepage "https://www.libtorrent.org/"
  url "https://github.com/arvidn/libtorrent/releases/download/v1.2.20/libtorrent-rasterbar-1.2.20.tar.gz"
  sha256 "ccbf8e8c21dc81635de95166b498922b4725f9725a23b2cfe2a6b2fead6fb9fc"
  license "BSD-3-Clause"

  depends_on "cmake" => :build
  depends_on "python-setuptools" => :build
  depends_on "boost@1.76.0"
  depends_on "boost-python3@1.76.0"
  depends_on "openssl@3"
  depends_on "python@3.14"

  conflicts_with "libtorrent-rakshasa", because: "both use the same libname"

  def install
    args = %W[
      -DCMAKE_CXX_STANDARD=14
      -Dencryption=ON
      -Dpython-bindings=ON
      -Dpython-egg-info=OFF
      -Dboost-python-module-name=python
      -DBOOST_ROOT=#{Formula["boost@1.76.0"].opt_prefix}
      -DBoost_NO_SYSTEM_PATHS=ON
      -DBoost_INCLUDE_DIR=#{Formula["boost@1.76.0"].opt_include}
      -DBoost_LIBRARY_DIR_RELEASE=#{Formula["boost@1.76.0"].opt_lib}
      -DPython3_EXECUTABLE=#{Formula["python@3.14"].opt_bin}/python3.14
      -DCMAKE_INSTALL_RPATH=#{lib}
    ]

    ENV.prepend_path "CMAKE_PREFIX_PATH", Formula["boost@1.76.0"].opt_prefix
    ENV.prepend_path "CMAKE_PREFIX_PATH", Formula["boost-python3@1.76.0"].opt_prefix

    system "cmake", "-S", ".", "-B", "build", *std_cmake_args, *args
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"

    libexec.install "examples"
  end

  test do
    args = [
      "-I#{Formula["boost@1.76.0"].include}/boost",
      "-L#{Formula["boost@1.76.0"].lib}",
      "-I#{include}",
      "-L#{lib}",
      "-lpthread",
      "-ltorrent-rasterbar",
    ]

    if OS.mac?
      args += [
        "-framework",
        "SystemConfiguration",
        "-framework",
        "CoreFoundation",
      ]
    end

    system ENV.cxx, libexec/"examples/make_torrent.cpp",
                    "-std=c++14", *args, "-o", "test"
    system "./test", test_fixtures("test.mp3"), "-o", "test.torrent"
    assert_path_exists testpath/"test.torrent"

    system Formula["python@3.14"].opt_bin/"python3.14", "-c", "import libtorrent as lt; print(lt.__version__)"
  end
end
