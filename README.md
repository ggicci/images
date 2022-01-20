# images

Premade docker images for [IO4 Workspaces](https://io4.io/about#workspaces) - provision a Visual Studio Code workspace on the cloud or your own infra, and access from your web browsers.

## Catalogue

| Environment | Image Name                                                          | Tags                                |
| ----------- | ------------------------------------------------------------------- | ----------------------------------- |
| Go          | [io4io/go-1.16.13](https://hub.docker.com/r/io4io/go-1.16.13)       | 1.0.0<br> 0.1.0                     |
| Pyton       | [io4io/python-3.9.10](https://hub.docker.com/r/io4io/python-3.9.10) | 1.0.0<br> 0.1.0                     |
| Node        | [io4io/node-16.13.2](https://hub.docker.com/r/io4io/node-16.13.2)   | 1.0.2<br> 1.0.1<br> 1.0.0<br> 0.1.0 |

## Code of Conduct

### Naming convention of the images and tags

1.  Use format `<org>/<env>-<env_version>:<image_version>` to name an image release. e.g.

    - `io4io/go-1.16.13:0.1.0`, which indicates the image is based on `Go 1.16.13`, and the built version is `0.1.0`,
    - `io4io/python-3.9.10:1.2.3`, which indicates the image is baded on `Python 3.9.10`,
    - etc.

2.  Don't use `v` as a prefix to the version number.
3.  Use the complete semver number, including `<major>`, `<minor>` and `<patch>`, i.e. `1.2.3`, not `1.2`, nor `1`.
