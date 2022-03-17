NAME := LFGBulletinBoard

VERSION ?= $(shell awk '$$2 == "Version:" { print $$3; exit }' "$(NAME)/$(NAME).toc")

ZIP := $(NAME)_$(VERSION).zip

FILES := *.toc *.lua *.xml *.blp *.txt

PREFIX ?= /media/classic-wow-addons

all: $(ZIP)

$(ZIP): $(NAME)
	@echo "Creating ZIP: $(ZIP)"
	@zip -r9 "$@" "$(NAME)"

install: $(ZIP)
	@echo "Installing (extracting) ZIP: $(ZIP)"
	@unzip -o "$(ZIP)" -d "$(PREFIX)"

uninstall:
	@echo "Uninstalling AddOn: $(NAME)"
	@rm -rvf "$(PREFIX)/$(NAME)"

prefixcopy:
	@echo "Overwriting with files from AddOn folder: $(NAME)"
	@cp -rT "$(PREFIX)/$(NAME)" "$(NAME)"

clean:
	@rm -vf "$(NAME)_"*.zip*
	@echo "Done."
