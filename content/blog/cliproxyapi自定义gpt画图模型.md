---
title: CLIProxyAPI自定义GPT画图模型
date: 2026-04-23T08:33:13.834Z
---

# 在 Kelivo 中通过 CLIProxyAPI v6.9.30+ 直接调用 GPT 画图

前几天分享《抛砖引玉，教你如何使用CLIProxyAPI来自定义GPT画图模型》一文后，不少小伙伴反馈通过脚本调用的方式确实不太方便。好消息是，作者在当天发布的 `v6.9.30` 版本中就对底层翻译器进行了更新，现在我们已经可以直接通过 OpenAI 兼容协议和 Gemini 原生协议，在客户端中愉快地画图了！

接下来，我们就以 Kelivo 客户端为例，看看具体的调用流程（这里不使用 Cherry Studio，主要是因为它内部将画图请求与固定模型名称做了强绑定，会导致我们的自定义模型无法被正确路由）。

首先，我们需要在 CLIProxyAPI 中完成相关的配置文件修改，依然可以参考前文《 [抛砖引玉，教你如何使用CLIProxyAPI来自定义GPT画图模型](https://lostip.de/blog/1109262072/) 》里的示例，这里就不再赘述。

配置完成后，打开 Kelivo 并在设置中添加一个新的 API 节点。协议选择 OpenAI，填入 CLIProxyAPI 的 Base URL 和 API Key，随后点击获取模型并添加，如下图所示：

![](https://i.imgur.com/5EbdjVn.png)

在添加的模型的属性中，确认输出模式中包含 `图片` ：

![](https://i.imgur.com/MigspEv.png)

最后，切换到该模型，直接在聊天窗口中输入提示词，就可以等待图片生成了。生成的效果如下：

![](https://i.imgur.com/jDLJKB5.png)



---

# 抛砖引玉，教你如何使用CLIProxyAPI来自定义GPT画图模型

昨天，在群里小伙伴的提醒下，我了解到通过反代 Codex 也可以进行图片的生成和编辑了。随即我进行了一番实验，使用 `GPT-Image-1.5` 成功生成了如下图片：

![](https://i.imgur.com/oZKtl9s.jpeg)

### 技术原理：工具调用（Tool Calling）

与 Gemini 使用专用图片模型（如 NanoBanana 系列）的逻辑不同，在 Codex 中，生图功能是通过 **调用工具** 实现的，并不依赖特定的模型名称。

基于这一特性，我们可以利用 `CLIProxyAPI` 的 **模型别名** 配合 **Payload 重写** 功能，自定义一套专属的“文生图模型”。下面我分享一下自己的配置思路和使用方法，希望能起到抛砖引玉的作用。

PS：下文前提是已经安装配置好 `CLIProxyAPI` 并添加了 Codex 的 OAuth 凭证。

---

### 1\. 配置文件修改

在 `CLIProxyAPI` 的配置文件中添加以下内容。这里我们将 `gpt-5.4-mini` 映射为不同分辨率的生图模型，并通过 Payload 强制开启 `image_generation` 工具。

```yaml
oauth-model-alias:
  codex:
    - name: gpt-5.4-mini
      alias: gpt-image-1024x1024
      fork: true
    - name: gpt-5.4-mini
      alias: gpt-image-1024x1536
      fork: true
    - name: gpt-5.4-mini
      alias: gpt-image-1536x1024
      fork: true

payload:
  override-raw:
    - models:
        - name: gpt-image-1024x1024
          protocol: codex
      params:
        tools: '[{"type":"image_generation", "size": "1024x1024", "quality": "high", "background": "auto"}]'
        tool_choice: '{"type": "image_generation"}'
    - models:
        - name: gpt-image-1024x1536
          protocol: codex
      params:
        tools: '[{"type":"image_generation", "size": "1024x1536", "quality": "high", "background": "auto"}]'
        tool_choice: '{"type": "image_generation"}'
    - models:
        - name: gpt-image-1536x1024
          protocol: codex
      params:
        tools: '[{"type":"image_generation", "size": "1536x1024", "quality": "high", "background": "auto"}]'
        tool_choice: '{"type": "image_generation"}'
```

添加完成后，我们就可以直接调用 `gpt-image-1024x1024` 、 `gpt-image-1024x1536` 和 `gpt-image-1536x1024` 这三个自定义模型了。

---

### 2\. 快速调用脚本 (PowerShell)

由于目前我还未找到好用的生图客户端，我编写了一个简单的 Windows PowerShell 脚本供大家参考。

**使用方法：**

1. 修改脚本前四行的 `apiUrl` 、 `apiKey` 等参数。
2. 将完整脚本粘贴至 PowerShell 窗口运行。
3. 等待约数十秒，即可在当前运行路径下看到生成的图片。

```powershell
$apiUrl = "https://你的CLIProxyAPI地址/v1/responses"
$apiKey = "你的CLIProxyAPI的apikey"
$model = "gpt-image-1536x1024"
$text = "画一张赛博朋克的香港，要有汉字"

$bodyObject = @{
  model = $model
  instructions = "You are a helpful assistant."
  input = @(
    @{
      type = "message"
      role = "user"
      content = @(
        @{
          type = "input_text"
          text = $text
        }
      )
    }
  )
  parallel_tool_calls = $true
  reasoning = @{
    effort = "high"
    summary = "auto"
  }
  stream = $true
  store = $false
  include = @(
    "reasoning.encrypted_content"
  )
}

$body = $bodyObject | ConvertTo-Json -Depth 100 -Compress

$outBase = "generated"
$utf8NoBom = New-Object System.Text.UTF8Encoding($false)
$tempBodyFile = Join-Path $env:TEMP ("response-body-" + [guid]::NewGuid().ToString("N") + ".json")
[System.IO.File]::WriteAllText($tempBodyFile, $body, $utf8NoBom)

try {
  curl.exe --silent --show-error --no-buffer \`
    -X POST $apiUrl \`
    -H "Content-Type: application/json" \`
    -H "Authorization: Bearer $apiKey" \`
    --data-binary ("@" + $tempBodyFile) |
  ForEach-Object -Begin {
    $eventType = $null
    $dataLines = [System.Collections.Generic.List[string]]::new()

    function Save-Bytes {
      param([string]$Path, [string]$Base64)
      [System.IO.File]::WriteAllBytes($Path, [Convert]::FromBase64String($Base64))
      Write-Host "Saved $Path"
    }

    function Save-ImageGenerationCallResult {
      param([object]$ImageCall)

      if (-not $ImageCall) { return }
      if ($ImageCall.type -ne "image_generation_call") { return }
      if (-not $ImageCall.result) { return }

      $ext = if ($ImageCall.output_format) { [string]$ImageCall.output_format } else { "png" }
      $path = Join-Path (Get-Location) "$outBase.$ext"
      Save-Bytes -Path $path -Base64 ([string]$ImageCall.result)
    }

    function ConvertFrom-JsonCompat {
      param([string]$Json)

      if ($PSVersionTable.PSVersion.Major -ge 6) {
        return $Json | ConvertFrom-Json -Depth 100
      }

      return $Json | ConvertFrom-Json
    }

    function Flush-SseEvent {
      param([string]$Type, [System.Collections.Generic.List[string]]$DataLines)

      if (-not $Type -or $DataLines.Count -eq 0) { return }

      $json = ($DataLines -join "\`n").Trim()
      if (-not $json -or $json -eq "[DONE]") { return }

      try {
        $obj = ConvertFrom-JsonCompat -Json $json
      } catch {
        return
      }

      switch ($Type) {
        "response.output_item.done" {
          Save-ImageGenerationCallResult -ImageCall $obj.item
        }

        "response.completed" {
          $imageCall = @(
            $obj.response.output |
            Where-Object { $_.type -eq "image_generation_call" -and $_.result }
          ) | Select-Object -First 1

          Save-ImageGenerationCallResult -ImageCall $imageCall
        }
      }
    }
  } -Process {
    $line = [string]$_

    if ($line.StartsWith("event:")) {
      if ($eventType -or $dataLines.Count -gt 0) {
        Flush-SseEvent -Type $eventType -DataLines $dataLines
        $dataLines = [System.Collections.Generic.List[string]]::new()
      }
      $eventType = $line.Substring(6).Trim()
      return
    }

    if ($line.StartsWith("data:")) {
      $dataLines.Add($line.Substring(5).TrimStart())
      return
    }

    if ([string]::IsNullOrWhiteSpace($line)) {
      Flush-SseEvent -Type $eventType -DataLines $dataLines
      $eventType = $null
      $dataLines = [System.Collections.Generic.List[string]]::new()
    }
  } -End {
    Flush-SseEvent -Type $eventType -DataLines $dataLines
  }
}
finally {
  if (Test-Path -LiteralPath $tempBodyFile) {
    Remove-Item -LiteralPath $tempBodyFile -Force
  }
}
```