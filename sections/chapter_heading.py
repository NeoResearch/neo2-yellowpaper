#!/usr/bin/env python

import yaml
import sys

#print("loading"+sys.argv[1])
with open(sys.argv[1], 'r') as stream:
    try:
        metadata = yaml.load(stream)
        authors = metadata["author"]
        if 'titlechapter' in metadata:
            listauthors=', '.join(authors)
            print("^[Chapter authors: "+listauthors+"]")
            if not ('released' in metadata):
                print("")
                print("**WARNING:** this section is an **unreleased draft**.")
                print("It is expected to be incomplete or even to carry incorrect information, so feel free to contribute with us!")
        abstract = metadata["abstract"]
        print("")
        print("**Abstract:** ")
        print(abstract)
        print("")
    except yaml.YAMLError as exc:
        print("")
