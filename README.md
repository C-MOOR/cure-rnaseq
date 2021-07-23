<img src="https://github.com/C-MOOR/c-moor.github.io/blob/master/img/cmoor_logo.png" height=120>

# Introduction to scRNA-seq Using R 

Preparing students to apply for a research position in genomic data science [[slides](https://docs.google.com/presentation/d/1iCIBzfhojoSciAD_BpNAYa2u3NbEmb-7XMxlLw-b1ow)]

- [Overview of Modules](#overview-of-modules)
- [Interactive LearnR Tutorials](#interactive-learnr-tutorials)
- [Sample Schedule](#sample-schedule)
- [Student Professional Development](#student-professional-development)
- [Getting Help](#getting-help)

Start your genomics adventure at Clovis Community College this [Fall 2021](https://www.cloviscollege.edu/landing/biol-12-genomics-data-science.html)

*Assumes high school biology and algebra, but no programming experience*

<img src="https://github.com/C-MOOR/c-moor.github.io/blob/master/img/BIOL11A.jpg" height=225>

## Overview of Modules

See [Sample Schedule](#sample-schedule) for additional details

- Data Exploration: Researching genes using biological databases
  - What Makes Cells Different? [[slides](https://docs.google.com/presentation/d/1kqXcTyi9Fh8wfsrg-JWEiRIlfMPooCUZLXw-VEnNaBE)]
  - Spreadsheet of Gene Expression [[slides](https://docs.google.com/presentation/d/1ZjXpkZl69ULDi2f4HzT9BW2yd8DBoUQGjc-0BASQen8)]
  - Biological Databases (Assignment / Discussion) [[assignment](https://docs.google.com/document/d/12DBD771jNr4H96Drsxc62KBllYQ5gzE33BiNdAzDbmw)]
  - Data Exploration Project (Start / Finish / Presentation) [[assignment](https://docs.google.com/document/d/1qnJBz3iAN12nAX0OFaxqZZZWs1qWLYxt_HWaBdfFEk8)]
- Single Cell: Increasing genomic resolution with new technologies
  - What Does Single Cell Enable?
  - cellxgene for scRNA-seq (Assignment / Discussion) [[slides](https://docs.google.com/presentation/d/1_CZv7yHOG2hYqL5-9t6nhmspwgdVPDzwyfM3_pJ2pqU)]
  - Single Cell Project (Start / Finish / Present)
- Pathway Analysis: Integrating genes using molecular networks
  - How Do Genes Work Together?
  - KEGG for Pathways (Assignment / Discussion) [[slides](https://docs.google.com/presentation/d/11DdaPXNHCCcswHL0ZiV1OhDHHR3xM_hVnYlArdsF9Lc)]
  - Pathway Analysis Project (Start / Finish / Present)
- Genes and Genomes: Understanding the role of genome organization
  - How Are Genes Regulated?
  - Genome Browser (Assignment / Discussion)	
  - Genes and Genomes Project (Start / Finish / Present)
- Scientific Literature
  - How to Read a Paper
  - Figure Analysis [[template](https://docs.google.com/document/d/1x-6IfH5VCYuinAf_4WKTDQrtX9mnjt9huC-hLwyc9ds)]
  - Reproducing Individual Results
- Project Work
  - Generating Hypotheses
  - Peer Review
  - How to Make a Poster
- Student Professional Development
  - Apply for Next Research Experience
  - Poster Symposium
  - Web Portfolio

## Interactive LearnR Tutorials

Preview some of our tutorials at [cure-rnaseq/tutorials](tutorials)

Note: Rendered previews are provided where possible, but tutorials that involve larger datasets or require more compute may not be available.  Tutorials run in most Shiny environments (e.g. local RStudio, sciserver.org, mybinder.org, shinyapps.io).  

## Sample Schedule

### Day 1

#### In Class

- Lecture: Welcome to Your Genomics Adventure!
- Lecture: The Scientific Process
- Activity: Create Accounts
  - Join SciServer [[assignment](https://docs.google.com/document/d/1EcJTjhfxAcRw66gUjQqEuogTvjBFatxEhrqxcWBOc4o)][[video](https://link.c-moor.org/video-join-sciserver)][[slides](https://docs.google.com/presentation/d/1kxbnBLoRsdPW4ZkjwNsAHS1XFPuJpQZ8I1aVqyZISW0)]
  - Join Discourse

#### Homework

- Assignment: Post to Discourse Forums [[assignment](https://docs.google.com/document/d/1XDT0i0aNsEBDXPzW-nd8o7VZWrNr49u2LDzS25JmpEs/)]

### Day 2

#### In Class

- Lecture: What Makes Cells Different? [[slides](https://docs.google.com/presentation/d/1kqXcTyi9Fh8wfsrg-JWEiRIlfMPooCUZLXw-VEnNaBE/edit#slide=id.g35f391192_00)]
- Activity: Spreadsheet of Gene Expression [[slides](https://docs.google.com/presentation/d/1ZjXpkZl69ULDi2f4HzT9BW2yd8DBoUQGjc-0BASQen8/edit)]
- Assignment: First learnR Tutorial [[assignment](https://docs.google.com/document/d/1nvMfvOTwwFIhub4aoTX3bGrY0AIDceT8SXA93FUBt5A)]
  - Join Group [[video](https://link.c-moor.org/video-join-sciserver-group)][[slides](https://docs.google.com/presentation/d/1codot9UeUO7l0EDcEre7dJgyXurD_xyxpw6IJL_aEjM)]
  - Start learnR [[video](https://drive.google.com/file/d/1WkhzNiTJqDk8oqrcSvu2C49TIhrfJVXh)][[slides](https://docs.google.com/presentation/d/1Oaq8RzhaDANxkNh-tTKwme7e095pGgoiq5iZHbt7PLg)]
  - Introduction to Model Organisms [[source](https://github.com/C-MOOR/cure-rnaseq/tree/master/tutorials/Model_Organisms_Intro)][[preview](http://mybinder.org/v2/gh/c-moor/cure-rnaseq/master?urlpath=shiny/tutorials/Model_Organisms_Intro/)]

#### Homework

- Assignment: Biological Databases [[assignment](https://docs.google.com/document/d/12DBD771jNr4H96Drsxc62KBllYQ5gzE33BiNdAzDbmw/edit)]
  - Model Organisms: Drosophila [[source](https://github.com/C-MOOR/cure-rnaseq/tree/master/tutorials/Model_Organisms_Drosophila)][[preview](http://mybinder.org/v2/gh/c-moor/cure-rnaseq/master?urlpath=shiny/tutorials/Model_Organisms_Drosophila/)]
  - Introduction to Biological Databases [[source](https://github.com/C-MOOR/cure-rnaseq/tree/master/tutorials/Biological_Databases_Intro)][[preview](http://mybinder.org/v2/gh/c-moor/cure-rnaseq/master?urlpath=shiny/tutorials/Biological_Databases_Intro/)]
  - Biological Databases: FlyBase [[source](https://github.com/C-MOOR/cure-rnaseq/tree/master/tutorials/Biological_Databases_FlyBase)][[preview](http://mybinder.org/v2/gh/c-moor/cure-rnaseq/master?urlpath=shiny/tutorials/Biological_Databases_FlyBase/)]
  - Biological Databases: Human Protein Atlas [[source](https://github.com/C-MOOR/cure-rnaseq/tree/master/tutorials/Biological_Databases_HPA)][[preview](http://mybinder.org/v2/gh/c-moor/cure-rnaseq/master?urlpath=shiny/tutorials/Biological_Databases_HPA/)]

### Day 3

#### In Class

- Discussion: Biological Databases [[assignment](https://docs.google.com/document/d/12DBD771jNr4H96Drsxc62KBllYQ5gzE33BiNdAzDbmw/edit)]
- Assignment: Data Exploration Project (Start) [[assignment](https://docs.google.com/document/d/1qnJBz3iAN12nAX0OFaxqZZZWs1qWLYxt_HWaBdfFEk8/edit#heading=h.km7myf8dtaah)][[gene list](https://docs.google.com/spreadsheets/d/16ltU53DkwYlYbcq8P_EzXSXidFaMkod75hyOAxTesw0/edit#gid=1158265355)]
- Activity: Test DriveR

#### Homework

- Assignment: Meet R! [[assignment](https://docs.google.com/document/d/1rxucOSJW_6OyYj_RJx9lp1f-cL7k5U2COZfpdl7mQ0A/)][[source](https://github.com/C-MOOR/cure-rnaseq/tree/master/tutorials/Intro_R)][[preview](http://mybinder.org/v2/gh/c-moor/cure-rnaseq/master?urlpath=shiny/tutorials/Intro_R/)]
- Assignment: Data Exploration Project (Finish) [[assignment](https://docs.google.com/document/d/1qnJBz3iAN12nAX0OFaxqZZZWs1qWLYxt_HWaBdfFEk8/edit#heading=h.km7myf8dtaah)][[gene list](https://docs.google.com/spreadsheets/d/16ltU53DkwYlYbcq8P_EzXSXidFaMkod75hyOAxTesw0/edit#gid=1158265355)]

### Day 4

#### In Class

- Presentation: Data Exploration Project [[assignment](https://docs.google.com/document/d/1qnJBz3iAN12nAX0OFaxqZZZWs1qWLYxt_HWaBdfFEk8/edit#heading=h.km7myf8dtaah)][[gene list](https://docs.google.com/spreadsheets/d/16ltU53DkwYlYbcq8P_EzXSXidFaMkod75hyOAxTesw0/edit#gid=1158265355)]
- Lecture: What Does Single Cell Enable?
- Assignment: Introduction to RStudio [[assignment](https://docs.google.com/document/d/1eXaBhhVz7AVe0A2QZFP8EMCOQh-qPgOUeuajZkZsPrI)]
  - Start RStudio [[video](https://drive.google.com/file/d/1TibezD0uVdI6uxd6y5e3Q71jCN8V4fDr)][[slides](https://docs.google.com/presentation/d/1xo-R10YmhhaTnXswOShjlFzRyLwlJs0ZtALZo-8tSR8)]
  - First Swirl ([Basic Building Blocks](https://github.com/swirldev/R_Programming_E/blob/master/Basic_Building_Blocks/lesson.yaml))

#### Homework

- Assignment: Swirl -- The basics of programming in R ([3,4,5,6,8,12](https://github.com/swirldev/R_Programming_E/blob/master/MANIFEST))
- Assignment: RStudio Console
- Assignment: cellxgene for scRNA-seq [[slides](https://docs.google.com/presentation/d/1_CZv7yHOG2hYqL5-9t6nhmspwgdVPDzwyfM3_pJ2pqU)]

### Day 5

#### In Class

- Discussion: cellxgene for scRNA-seq [[slides](https://docs.google.com/presentation/d/1_CZv7yHOG2hYqL5-9t6nhmspwgdVPDzwyfM3_pJ2pqU)]
- Assignment: Single Cell Project (Start)
- Activity: Managing Data in the Cloud

#### Homework

- Assignment: R for Data Science ([Introduction](https://r4ds.had.co.nz/introduction.html))
- Assignment: Single Cell Project (Finish)

### Day 6

#### In Class

- Presentation: Single Cell Project
- Lecture: How Do Genes Work Together?
- Assignment: Working with R Notebooks

#### Homework

- Assignment: Orchestrating Single-Cell Analysis ([Overview](https://bioconductor.org/books/release/OSCA/overview.html))
- Assignment: R for Data Science ([Data Visualization](https://r4ds.had.co.nz/data-visualisation.html))
- Assignment: KEGG for Pathways [[slides](https://docs.google.com/presentation/d/11DdaPXNHCCcswHL0ZiV1OhDHHR3xM_hVnYlArdsF9Lc)]

## Student Professional Development

### Web Portfolios Using GitHub [[repo](https://github.com/C-MOOR/cmoor_website_template)][[demo](http://www.c-moor.org/cmoor_website_template/)]

- Create GitHub Account [[video](https://link.c-moor.org/video-join-github)][[slides](https://docs.google.com/presentation/d/1c4sb5CLpvKjgnTVIuNGYTSr8WWNgeSfC8TUGrxktu64)]
- Setup Website [[video](https://link.c-moor.org/video-student-website-setup)][[slides](https://docs.google.com/presentation/d/13chl2zYU1NbWCZmD_daqiKcLoJZAtILMqjXgew3TR6c/edit#slide=id.g35f391192_00)]
- Personalize Website
  -  Profile [[video](https://link.c-moor.org/video-student-website-personalize-profile)][[slides](https://docs.google.com/presentation/d/1Fvf-pp35kzthJawqHwNVg8fTA5YDOWSOD88hVBFs840/)]
  -  About [[video](https://link.c-moor.org/video-student-website-personalize-about)][[slides](https://docs.google.com/presentation/d/1qg3i5WhpqiPrLPdLdJoiVaCmZALNpPrlbHwBigbtfYo/)]
  -  Languages [[video](https://link.c-moor.org/video-student-website-personalize-languages)][[slides](https://docs.google.com/presentation/d/1jLbdARLPvVnEl0HA18Jli0qQ90Bg9JFbenRqLBSeovk/)]
  -  Site Preview [[video](https://link.c-moor.org/video-student-website-personalize-preview)][[slides](https://docs.google.com/presentation/d/1r3PPXaHUnZfzeKe4hZisaVM7Edz5VLw6hnKHzvifoWE/)]
- Add First Post

## Getting Help

Join the conversation in our [Slack](https://c-moor.slack.com) or [Discourse forums](https://help.c-moor.org)!

<hr>

C-MOOR is supported in part by [Carnegie Science Venture Grant](https://carnegiescience.edu/CSVgrants#section2) and [NSF DUE Award #2021013](https://www.nsf.gov/awardsearch/showAward?AWD_ID=2021013)

<img src="https://github.com/C-MOOR/c-moor.github.io/blob/master/img/Carnegie_EMB_logo.png" height=35> <img src="https://github.com/C-MOOR/c-moor.github.io/blob/master/img/Clovis_logo_wide.jpg" height=35> <img src="https://github.com/C-MOOR/c-moor.github.io/blob/master/img/JHU_logo.jpg" height=35> <img src="https://idies.jhu.edu/wp-content/uploads/2020/03/cropped-IDIES_logo-500px.png" height=35>
