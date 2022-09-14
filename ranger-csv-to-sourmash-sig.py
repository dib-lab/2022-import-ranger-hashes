#! /usr/bin/env python
import csv
import sourmash
from sourmash import sourmash_args 
import argparse
import sys


def main():
    p = argparse.ArgumentParser()
    p.add_argument('input_csv')
    p.add_argument('output_sig')
    args = p.parse_args()

    mh = sourmash.MinHash(n=0, ksize=31, scaled=2000)

    with open(args.input_csv, newline='') as fp:
        print(f"opening {args.input_csv} as a CSV")
        r = csv.DictReader(fp)
        for row in r:
            hashval = int(row['names'])
            mh.add_hash(hashval)

    print(f'loaded {len(mh)} hashes from input.')

    ss = sourmash.SourmashSignature(mh, filename=args.input_csv)
    with sourmash_args.SaveSignaturesToLocation(args.output_sig) as save_sig:
        save_sig.add(ss)

    print(f'saved signature to {args.output_sig}')


if __name__ == '__main__':
    sys.exit(main())
