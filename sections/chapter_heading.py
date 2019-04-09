#!/usr/bin/env python

import yaml
import sys

#print("loading"+sys.argv[1])
with open(sys.argv[1], 'r') as stream:
    try:
        metadata = yaml.load(stream)
        authors = metadata["author"]
        listauthors=', '.join(authors)
        if not ('released' in metadata):
            print("")
            print("**WARNING:** this chapter is an **unreleased draft**.")
            print("It is expected to be incomplete or even to carry incorrect information, so feel free to contribute with us!")
        print("")
        print("**Chapter:** "+metadata["title"])
        print("")
        print("**Authors:** "+listauthors)
        print("")
        print("**Abstract:** "+metadata["abstract"])
        print("")
    except yaml.YAMLError as exc:
        print("")
