## Using SciServer

- Day 1 — Join SciServer [[assignment](https://docs.google.com/document/d/1EcJTjhfxAcRw66gUjQqEuogTvjBFatxEhrqxcWBOc4o)][[video](https://link.c-moor.org/video-join-sciserver)][[slides](https://docs.google.com/presentation/d/1kxbnBLoRsdPW4ZkjwNsAHS1XFPuJpQZ8I1aVqyZISW0)]
- Day 2 — Start learnR [[assignment](https://docs.google.com/document/d/1nvMfvOTwwFIhub4aoTX3bGrY0AIDceT8SXA93FUBt5A)]
  - 2a — Join Group [[video](https://link.c-moor.org/video-join-sciserver-group)][[slides](https://docs.google.com/presentation/d/1codot9UeUO7l0EDcEre7dJgyXurD_xyxpw6IJL_aEjM)]
  - 2b — Start learnR [[video](https://drive.google.com/file/d/1WkhzNiTJqDk8oqrcSvu2C49TIhrfJVXh)][[slides](https://docs.google.com/presentation/d/1Oaq8RzhaDANxkNh-tTKwme7e095pGgoiq5iZHbt7PLg)]
- Day 4 — Start RStudio [[assignment](https://docs.google.com/document/d/1eXaBhhVz7AVe0A2QZFP8EMCOQh-qPgOUeuajZkZsPrI)][[video](https://drive.google.com/file/d/1TibezD0uVdI6uxd6y5e3Q71jCN8V4fDr)][[slides](https://docs.google.com/presentation/d/1xo-R10YmhhaTnXswOShjlFzRyLwlJs0ZtALZo-8tSR8)]

## SciServer integration

### C-MOOR LearnR

To build the SciServer image, set the context directory to the base of this repo. For example, from the base:

```
docker build -f sciserver/Dockerfile --tag c-moor_learnr .
```

### C-MOOR RStudio

Dockerfile available in [sciserver/sciserver-base-images](https://github.com/sciserver/sciserver-base-images/tree/sciserver-rstudio_2.0/.refactored/c-moor)

