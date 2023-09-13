# mrx-website layouts

The website originally used [docsy](https://www.docsy.dev/) and was then
gradually migrated to use [fomantic-ui](https://fomantic-ui.com) for styling
while retaining most of the design guides of docsy. The result is a smaller
theme where you don't have to learn bootstrap yet you can still stand a chance
of guessing the right style classes.

## Highlights

* `shortcodes/d/xxx` contain document level shortcodes e.g. `d/caption`
* `shortcodes/f/xxx` contain fomatic wrappers e.g. `f/iumage`
* `partials/sitelinks.html` use this for your global links e.g. `[contacts]`
* most shortcodes are implemented as partials for consistency
