# Redmine Mail From plugin

This plugin adds user name and/or mail address to "From:" field of mail notification.

## Usage

Add `%f`, `%l`, `%m` and/or `%u` to field "Emission email address" in settings.

* `%f` - First name
* `%l` - Last name
* `%m` - Mail address
* `%u` - Login name

Exmaple:

![Setting example](doc/img/setting-example.png)

`%m` is replaced with empty if the user preference "Hide my email address" is enabled.

`%f`, `%m` and `%u` are replaced with empty if the user is anonymous.

## License

This plugin is released under the terms of GNU General Public License, version 2.

## Author

Takeshi Nakamura
