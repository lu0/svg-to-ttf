# svg-to-ttf
A alpine based image to convert svg glyphs and generate TTF font using [fontcustom](https://github.com/rfbezerra/fontcustom).

This image includes:
* [Inkscape](https://inkscape.org/)
* [Xvfb](https://www.x.org/releases/X11R7.6/doc/man/man1/Xvfb.1.xhtml)
* [parallel](https://www.gnu.org/software/parallel/)
* [Fontcustom](https://github.com/FontCustom/fontcustom)

## Volumes
This image defines a single volume:
* /fonts - Base directory where all works run

## Process
This image will copy all svg glyphs from /fonts/INPUT_FOLDER to a temporary directory.

After that, if choose, all glyphs will be converted from stroke to path. Some fonts need this step, like [Feather](https://github.com/feathericons/feather).

Finally, [Fontcustom](https://github.com/FontCustom/fontcustom) is used to generate desired TTF font.

## Use
Help message :
```shell
docker run --rm -v WORK_DIRECTORY:/fonts lu0alv/svg-to-ttf-charmap -h
```
```
Usage: docker run --rm -v "${PWD}":/fonts lu0alv/svg-to-ttf-charmap [OPTIONS]
  -g, --gid [GID]               GroupId owner of the destination folder; default is equal to uid
  -i, --input [FOLDER]          Folder where svg glyphs lives; default is ./input
  -n, --name FONT_NAME          Name of the generated font
  -c, --codepoint [CODEPOINT]   Starting point for the character map, hexadecimal."
  -o, --output [FOLDER]         Destination folder for generated fonts; default is ./FONT_NAME
  -s, --skip_conversion         Skip the conversion from stroke to path
  -u, --uid [UID]               UserId owner of the destination folder; default is 0 (root)
  -h, --help                    Show this help message
```

Simple font generation:
```shell
docker run --rm -v WORK_DIRECTORY:/fonts lu0alv/svg-to-ttf-charmap -n FONT_NAME
```
This command will read all svg glyphs from WORK_DIRECTORY/input and create a folder named FONT_NAME with generated TTF font into.

If you want to define another output folder:
```shell
docker run --rm -v WORK_DIRECTORY:/fonts lu0alv/svg-to-ttf-charmap -n FONT_NAME -o OUTPUT_FOLDER
```

If you want that the result of build respect your user:
```shell
docker run --rm -v WORK_DIRECTORY:/fonts lu0alv/svg-to-ttf-charmap -n FONT_NAME -u $(id -u)
```
(GID is optional)

If you dont need to convert stroke to path:
```shell
docker run --rm -v WORK_DIRECTORY:/fonts lu0alv/svg-to-ttf-charmap -n FONT_NAME -s
```

If you want to specify the starting point of the character map:
```shell
docker run --rm -v WORK_DIRECTORY:/fonts lu0alv/svg-to-ttf-charmap -n FONT_NAME -c e916
```


## Contributing

Contributions are what make the open source community such an amazing place to be learn, inspire, and create. Any contributions you make are **greatly appreciated**.

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request


## Thanks
[![Donate](https://www.paypalobjects.com/en_US/i/btn/btn_donateCC_LG.gif)](https://www.paypal.com/cgi-bin/webscr?cmd=_donations&business=6ZPRN6FTR8SKA&currency_code=USD&source=url)

If you want to buy me a :beer: :)

## Fork notes:
This is a fork of
[rfbezerra's `svg-to-ttf` repo](https://github.com/rfbezerra/svg-to-ttf)
I modified to have the ability to specify the starting point of the charmap
using a new option `-c` or `--codepoint`.
