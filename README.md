# DoSomething Auth

This gem enables the DoSomething authentication system for Rails projects.  It creates four routes:

```
[GET] YOUR_APP/login - Log in / register page.
[POST] YOUR_APP/login - Handles actual authorization / registration.
[GET] YOUR_APP/logout - Logs the current session out.
[GET] YOUR_APP/gate-test/blank - Test page for gated_pages method (see below).
```

## Install

To install this gem and its associated functionality, add this to your Gemfile:

`gem 'ds_auth', git: 'git@github.com:DoSomething/dosomething-auth.git'`

## Usage

This gem handles a large portion of the auth functionality by itself.  It does, however, add a new method: `gated_pages`.

`gated_pages` allows you to gate any action for any controller.  It can be used with or without parameters, as follows:

```
# Gates the "your_action" action
gated_pages :your_action

# Gates the "your_action" action and requires you to be an administrator
gated_pages :your_action, require: [:administrator]

# Gates the "your_action" action and requires you to be an administrator AND a content loader.
gated_pages :your_action, require: [:administrator, 'content loader']

# Gates the "your_action" action and requires you to be an administrator OR a content loader (both is fine).
gated_pages :your_action, require: [:administrator, 'content loader'], type: :any
```

