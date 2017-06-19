# Cranfield

This contains parsers to convert the, frankly weird, format of the corpus within the [Cranfield collection](http://ir.dcs.gla.ac.uk/resources/test_collections/cran/) to something slightly more sane.

Currently it generates JSON.

## Usage

To generate the JSON formatted corpus:

```
$ rake
```

This will create an output directory containing the corpus in `output/corpus.json`

Currently only the corpus is converted, maybe in the future (if I need it) it will also convert the queries and relevance results, maybe.

## Background

The Cranfield collection is a test collection allowing precise quantitative measures of information retrieval effectiveness. Collected in the United Kingdom starting in the late 1950s, it contains 1398 abstracts of aerodynamics journal articles, a set of 225 queries, and exhaustive relevance judgments of all (query, document) pairs.
