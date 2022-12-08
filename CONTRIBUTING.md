# Contributing

## Reporting security issues

We take security seriously. If you discover a security issue, please bring it 
to their attention right away!

Please **DO NOT** file a public issue, instead send your report privately to 
[foss-security@univ-rennes2.fr](mailto:foss-security@univ-rennes2.fr).

Security reports are greatly appreciated and we will publicly thank you for it.

## Reporting other issues

A great way to contribute to the project is to send a detailed report when you 
encounter an issue. We always appreciate a well-written, thorough bug report, 
and will thank you for it !

Check that [our issue database](https://github.com/DSI-Universite-Rennes2/get-partage-logs)
doesn't already include that problem or suggestion before submitting an issue. If you 
find a match, you can use the "subscribe" button to get notified on updates. Do *not* 
leave random "+1" or "I have this too" comments, as they only clutter the discussion, 
and don't help resolving it. However, if you have ways to reproduce the issue or 
have additional information that may help resolving the issue, please leave a comment.

When reporting issues, always include:

* The version you used or reference to commit id if you used directly git sources,
* OS version,
* Bash version,

Also include the steps required to reproduce the problem if possible and
applicable. This information will help us review and fix your issue faster.
When sending lengthy log-files, consider posting them as a gist (<https://gist.github.com>).
Don't forget to remove sensitive data from your logfiles before posting (you can
replace those parts with "REDACTED").

## Quick contribution tips and guidelines

This section gives the experienced contributor some tips and guidelines.

### Pull requests are always welcome

Not sure if that typo is worth a pull request ? Found a bug and know how to fix
it ? Do it ! We will appreciate it.
Any significant improvement should be documented as 
[a GitHub issue](https://github.com/DSI-Universite-Rennes2/get-partage-logs/issues)

### Conventions

Fork the repository and make changes on your fork in a custom branch:

* If it's a bug fix branch, name it XXXX-something where XXXX is the number of
    the issue.
* If it's a feature branch, create an enhancement issue to announce
    your intentions, and name it XXXX-something where XXXX is the number of the
    issue.

Write clean code. Universally formatted code promotes ease of writing, reading,
and maintenance.

Pull request descriptions should be as clear as possible and include a reference
to all the issues that they address.

### Sign your work

The sign-off is a simple line at the end of the explanation for the patch. Your
signature certifies that you wrote the patch or otherwise have the right to pass
it on as an open-source patch. The rules are pretty simple: if you can certify
the below (from [developercertificate.org](http://developercertificate.org/)):

```text
Developer Certificate of Origin
Version 1.1

Copyright (C) 2004, 2006 The Linux Foundation and its contributors.
1 Letterman Drive
Suite D4700
San Francisco, CA, 94129

Everyone is permitted to copy and distribute verbatim copies of this
license document, but changing it is not allowed.

Developer's Certificate of Origin 1.1

By making a contribution to this project, I certify that:

(a) The contribution was created in whole or in part by me and I
    have the right to submit it under the open source license
    indicated in the file; or

(b) The contribution is based upon previous work that, to the best
    of my knowledge, is covered under an appropriate open source
    license and I have the right under that license to submit that
    work with modifications, whether created in whole or in part
    by me, under the same open source license (unless I am
    permitted to submit under a different license), as indicated
    in the file; or

(c) The contribution was provided directly to me by some other
    person who certified (a), (b) or (c) and I have not modified
    it.

(d) I understand and agree that this project and the contribution
    are public and that a record of the contribution (including all
    personal information I submit with it, including my sign-off) is
    maintained indefinitely and may be redistributed consistent with
    this project or the open source license(s) involved.
```

Then you just add a line to every git commit message:

```text
    Signed-off-by: Joe Smith <joe.smith@email.com>
```

Use your real name (sorry, no pseudonyms or anonymous contributions.)

If you set your `user.name` and `user.email` git configs, you can sign your
commit automatically with `git commit -s`.
/issues)
before anybody starts working on it.

We are always thrilled to receive pull requests. We do our best to process them
quickly.
