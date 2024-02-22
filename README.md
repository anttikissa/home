## Cloning to a new computer:

	cd
	git clone git@github.com:anttikissa/home.git home
	mv -vi home/.* home/* .
	rmdir home

## Adding new files

- Add file (eg .aliases)
- Add negative .gitignore rule

	!.aliases

- Adding directory needs two rules:

	!.config
	!.config/**

