# ci

## About `release-matrix.txt`

```text
1.0.0 blank
1.1.0 go python
1.2.0 node
1.2.1 go python node
2.0.0 blank go python node
2.0.1 python
```

Every line contains a `version` with a followed list of `images`. `ci/build-images.sh` will be triggered on every pull request and release event. Once the current tag (version) of this repository hit a line in this matrix, the corresponding images will get built afterwards.
