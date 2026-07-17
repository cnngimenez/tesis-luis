# Copyright 2019 Christian Gimenez

# Author: Christian Gimenez   

# Makefile

# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

SHELL := bash
.ONESHELL:
.SHELLFLAGS := -eu -o pipefail -c
.DELETE_ON_ERROR:
MAKEFLAGS += --warn-undefined-variables
MAKEFLAGS += --no-builtin-rules
.RECIPEPREFIX = >

all: main.pdf

main.pdf: main.tex
> latexmk -lualatex main.tex

clean:
> @echo 'Borrando temporales y archivos generados.'
> latexmk -C main
> @echo 'Borrando generados por BibLaTeX'
> rm main.bbl
.PHONY: clean
