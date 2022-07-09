all:
	stow --verbose --target=$$HOME --restow -t ~ */

delete:
	stow --verbose --target=$$HOME --delete -t ~ */
