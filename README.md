# Redmine Mail From plugin

This plugin adds user name and/or mail address to the "From:" header field of the notification mail.

## Usage

Add `%f`, `%l`, `%m` and/or `%u` to the "Emission email address" field under the "Email notifications" tab in Redmine settings.

* `%f` - First name
* `%l` - Last name
* `%m` - Mail address
* `%u` - Login name

### Exmaple

![Setting example](doc/img/setting-example.png)

If Axl Rose (a.rose@gnr.com) operates Redmine, the notification is sent with `From: Axl Rose via Redmine <a.rose@gnr.com>`.

### Notes

* `%m` is replaced with empty if the user preference "Hide my email address" is enabled.
* `%f`, `%m` and `%u` are replaced with empty if the user is anonymous.

## License

This plugin is released under the terms of GNU General Public License, version 2.

## Author

Takeshi Nakamura
