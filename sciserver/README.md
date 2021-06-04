### SciServer integration

#### C-MOOR LearnR

To build the SciServer image, set the context directory to the base of this repo. For example, from the base:

```
docker build -f sciserver/Dockerfile --tag c-moor_learnr .
```

#### C-MOOR RStudio

Dockerfile available in [sciserver/sciserver-base-images](https://github.com/sciserver/sciserver-base-images/tree/sciserver-rstudio_2.0/.refactored/c-moor)
