all:
	stow --verbose --target=$$HOME --adopt --restow -t ~ */

delete:
	stow --verbose --target=$$HOME --delete -t ~ */
