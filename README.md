<br /><img src="https://github.com/dockserver/dockserver/blob/master/logo/cover.png"  width="600" height="300" style="vertical-align:middle">

[![Website: https://dockserver.io](https://img.shields.io/badge/Website-https%3A%2F%2Fdockserver.io-blue.svg?style=for-the-badge&colorB=177DC1&label=website)](https://dockserver.io)
[![Discord: https://discord.gg/A7h7bKBCVa](https://img.shields.io/badge/Discord-gray.svg?style=for-the-badge)](https://discord.gg/A7h7bKBCVa)
[![License: GPL 3](https://img.shields.io/badge/License-GPL%203-blue.svg?style=for-the-badge&colorB=177DC1&label=license)](LICENSE)

*Docker + Traefik with Authelia and Cloudflare Protection*


## Minimum Specs

* Ubuntu 18/20 or Debian 9/10
* 2 Cores
* 4GB Ram
* 20GB Disk Space

## Requirements

* A VPS/VM or Dedicated Server

* Domain

* [Cloudflare](https://dash.cloudflare.com/sign-up) account free tier

## Pre-Install

1. Login to your Cloudflare Account & goto DNS click on Add record.
2. Add 1 **A-Record** pointed to your server's ip.
3. Copy your [CloudFlare-Global-Key](https://support.cloudflare.com/hc/en-us/articles/200167836-Managing-API-Tokens-and-Keys) and [CloudFlare-Zone-ID](https://support.cloudflare.com/hc/en-us/articles/200167836-Managing-API-Tokens-and-Keys).

### Set the following on Cloudflare

1. `SSL = FULL` **( not FULL/STRICT )**
2. `Always on = YES`
3. `http to https = YES`
4. `RocketLoader and Broli / Onion Routing = NO`
5. `Tls min = 1.2`
6. `TLS = v1.3`

## Easy Mode install

Run the following command:

```sh
sudo wget -qO- https://git.io/J3GDc | sudo bash
```

<details>
  <summary>Long commmand if the short one doesn't work.</summary>
  <br />

  ```sh
  sudo wget -qO- https://raw.githubusercontent.com/dockserver/dockserver/master/wgetfile.sh | sudo bash
  ```

</details>

## Support

Kindly report any issues/broken-parts/bugs on [github](https://github.com/dockserver/dockserver/issues) or [discord](https://discord.gg/A7h7bKBCVa)

* Join our [![Discord: https://discord.gg/A7h7bKBCVa](https://img.shields.io/badge/Discord-gray.svg?style=for-the-badge)](https://discord.gg/A7h7bKBCVa) for Support

## Code and Permissions

```sh
Copyright 2021 @dockserver
Code owner @dockserver
Dev Code @dockserver
Co-Dev -APPS- @CONTRIBUTORS-LIST
```

----


<!--START_SECTION:activity-->
1. 🎉 Merged PR [#10](https://github.com/dockserver/dockserver/pull/10) in [dockserver/dockserver](https://github.com/dockserver/dockserver)
2. 💪 Opened PR [#10](https://github.com/dockserver/dockserver/pull/10) in [dockserver/dockserver](https://github.com/dockserver/dockserver)
3. ❗️ Closed issue [#1](https://github.com/dockserver/dockserver/issues/1) in [dockserver/dockserver](https://github.com/dockserver/dockserver)
4. 🎉 Merged PR [#9](https://github.com/dockserver/dockserver/pull/9) in [dockserver/dockserver](https://github.com/dockserver/dockserver)
5. 🗣 Commented on [#1](https://github.com/dockserver/dockserver/issues/1) in [dockserver/dockserver](https://github.com/dockserver/dockserver)
6. 💪 Opened PR [#9](https://github.com/dockserver/dockserver/pull/9) in [dockserver/dockserver](https://github.com/dockserver/dockserver)
7. 🗣 Commented on [#1](https://github.com/dockserver/dockserver/issues/1) in [dockserver/dockserver](https://github.com/dockserver/dockserver)
8. ❌ Closed PR [#8](https://github.com/dockserver/dockserver/pull/8) in [dockserver/dockserver](https://github.com/dockserver/dockserver)
9. 🗣 Commented on [#1](https://github.com/dockserver/dockserver/issues/1) in [dockserver/dockserver](https://github.com/dockserver/dockserver)
10. 💪 Opened PR [#8](https://github.com/dockserver/dockserver/pull/8) in [dockserver/dockserver](https://github.com/dockserver/dockserver)
11. 🗣 Commented on [#1](https://github.com/dockserver/dockserver/issues/1) in [dockserver/dockserver](https://github.com/dockserver/dockserver)
12. 🎉 Merged PR [#7](https://github.com/dockserver/dockserver/pull/7) in [dockserver/dockserver](https://github.com/dockserver/dockserver)
13. 💪 Opened PR [#7](https://github.com/dockserver/dockserver/pull/7) in [dockserver/dockserver](https://github.com/dockserver/dockserver)
14. 🎉 Merged PR [#6](https://github.com/dockserver/dockserver/pull/6) in [dockserver/dockserver](https://github.com/dockserver/dockserver)
15. 🗣 Commented on [#1](https://github.com/dockserver/dockserver/issues/1) in [dockserver/dockserver](https://github.com/dockserver/dockserver)
16. 💪 Opened PR [#6](https://github.com/dockserver/dockserver/pull/6) in [dockserver/dockserver](https://github.com/dockserver/dockserver)
17. 🗣 Commented on [#1](https://github.com/dockserver/dockserver/issues/1) in [dockserver/dockserver](https://github.com/dockserver/dockserver)
18. 🎉 Merged PR [#5](https://github.com/dockserver/dockserver/pull/5) in [dockserver/dockserver](https://github.com/dockserver/dockserver)
19. 🗣 Commented on [#1](https://github.com/dockserver/dockserver/issues/1) in [dockserver/dockserver](https://github.com/dockserver/dockserver)
20. 💪 Opened PR [#5](https://github.com/dockserver/dockserver/pull/5) in [dockserver/dockserver](https://github.com/dockserver/dockserver)
<!--END_SECTION:activity-->


----

## Contributors ✨

Thanks goes to these wonderful people ([emoji key](https://allcontributors.org/docs/en/emoji-key)):

<!-- ALL-CONTRIBUTORS-LIST:START - Do not remove or modify this section -->
<!-- prettier-ignore-start -->
<!-- markdownlint-disable -->
<table>
  <tr>
    <td align="center"><a href="https://github.com/mrfret"><img src="https://avatars.githubusercontent.com/u/72273384?v=4?s=100" width="100px;" alt=""/><br /><sub><b>mrfret</b></sub></a><br /><a href="#infra-mrfret" title="Infrastructure (Hosting, Build-Tools, etc)">🚇</a> <a href="https://github.com/dockserver/dockserver/commits?author=mrfret" title="Tests">⚠️</a> <a href="https://github.com/dockserver/dockserver/commits?author=mrfret" title="Code">💻</a> <a href="#content-mrfret" title="Content">🖋</a></td>
    <td align="center"><a href="https://github.com/doob187"><img src="https://avatars.githubusercontent.com/u/60312740?v=4?s=100" width="100px;" alt=""/><br /><sub><b>doob187</b></sub></a><br /><a href="#infra-doob187" title="Infrastructure (Hosting, Build-Tools, etc)">🚇</a> <a href="https://github.com/dockserver/dockserver/commits?author=doob187" title="Tests">⚠️</a> <a href="https://github.com/dockserver/dockserver/commits?author=doob187" title="Code">💻</a> <a href="#content-doob187" title="Content">🖋</a></td>
    <td align="center"><a href="https://github.com/aelfa"><img src="https://avatars.githubusercontent.com/u/60222501?v=4?s=100" width="100px;" alt=""/><br /><sub><b>Aelfa</b></sub></a><br /><a href="https://github.com/dockserver/dockserver/commits?author=aelfa" title="Tests">⚠️</a> <a href="https://github.com/dockserver/dockserver/issues?q=author%3Aaelfa" title="Bug reports">🐛</a> <a href="#infra-aelfa" title="Infrastructure (Hosting, Build-Tools, etc)">🚇</a> <a href="https://github.com/dockserver/dockserver/commits?author=aelfa" title="Code">💻</a> <a href="#content-aelfa" title="Content">🖋</a></td>
    <td align="center"><a href="https://github.com/DrAg0n141"><img src="https://avatars.githubusercontent.com/u/44865095?v=4?s=100" width="100px;" alt=""/><br /><sub><b>DrAg0n141</b></sub></a><br /><a href="#infra-DrAg0n141" title="Infrastructure (Hosting, Build-Tools, etc)">🚇</a> <a href="https://github.com/dockserver/dockserver/commits?author=DrAg0n141" title="Tests">⚠️</a> <a href="https://github.com/dockserver/dockserver/commits?author=DrAg0n141" title="Code">💻</a> <a href="#content-DrAg0n141" title="Content">🖋</a></td>
  </tr>
  <tr>
    <td align="center"><a href="https://github.com/Nossersvinet"><img src="https://avatars.githubusercontent.com/u/83166809?v=4?s=100" width="100px;" alt=""/><br /><sub><b>Nossersvinet</b></sub></a><br /><a href="#infra-Nossersvinet" title="Infrastructure (Hosting, Build-Tools, etc)">🚇</a> <a href="https://github.com/dockserver/dockserver/commits?author=Nossersvinet" title="Tests">⚠️</a> <a href="https://github.com/dockserver/dockserver/commits?author=Nossersvinet" title="Code">💻</a> <a href="#content-Nossersvinet" title="Content">🖋</a></td>
    <td align="center"><a href="https://github.com/townsmcp"><img src="https://avatars.githubusercontent.com/u/14061617?v=4?s=100" width="100px;" alt=""/><br /><sub><b>townsmcp</b></sub></a><br /><a href="https://github.com/dockserver/dockserver/issues?q=author%3Atownsmcp" title="Bug reports">🐛</a> <a href="https://github.com/dockserver/dockserver/commits?author=townsmcp" title="Tests">⚠️</a></td>
    <td align="center"><a href="https://github.com/Hawkinzzz"><img src="https://avatars.githubusercontent.com/u/24587652?v=4?s=100" width="100px;" alt=""/><br /><sub><b>hawkinzzz</b></sub></a><br /><a href="https://github.com/dockserver/dockserver/issues?q=author%3AHawkinzzz" title="Bug reports">🐛</a> <a href="https://github.com/dockserver/dockserver/commits?author=Hawkinzzz" title="Tests">⚠️</a></td>
  </tr>
</table>

<!-- markdownlint-restore -->
<!-- prettier-ignore-end -->

<!-- ALL-CONTRIBUTORS-LIST:END -->
