# BacklogApiClient
[![wercker status](https://app.wercker.com/status/de4cb885aa9f05ab44c7d5364f6c9281/m "wercker status")](https://app.wercker.com/project/bykey/de4cb885aa9f05ab44c7d5364f6c9281)

backlog-api-client is a library to make it easy to use Backlog(http://www.backlog.jp/) Restful API(V2) for Ruby.

- official document
  - http://developer.nulab-inc.com/docs/backlog/api/2/

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'backlog-api-client'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install backlog-api-client

## Usage

### example
```ruby
cli = BacklogApiClient::Client.new('joe-re.backlog.jp', '8EnEQMOapDlZHHXPTMfNy8ByikEYXLDdbS1A1htuLNTRtpU7Q7hIP4JY7gEhLyqt') # with space_name and api_key

# get issue list
cli.issues.list({ 'projectId[]' => 16931 })

# create issue
cli.issues.create({
  'projectId' => 16931,
  'summary' => 'test summary',
  'description' => 'make for test',
  'issueTypeId' => 74279,
  'priorityId' => 3,
})

# update issue
cli.issues.update('TST-3', {
  'summary' => 'test summary update',
  'description' => 'make for test',
  'issueTypeId' => 74279,
  'priorityId' => 3,
})
```

### support methods
#### Space
- Get Space(/api/v2/space)
- Get Recent Updates(/api/v2/space/activities)
- Get Space Logo(/api/v2/space/image)
- Get Space Information(/api/v2/space/notification)
- Update Space Information(/api/v2/space/notification
- Get Space Disk Usage(/api/v2/space/diskUsage)
- Post Attachment File(/api/v2/space/attachment)

#### Users
- Get User List(/api/v2/users)
- Get User(/api/v2/users/:userId)
- Add User(/api/v2/users)
- Delete User(/api/v2/users/:userId)
- Get Own Usre(/api/v2/users/myself)
- Get User Icon(/api/v2/users/:userId/icon)
- Get User Recent Updates(/api/v2/users/:userId/activities)
- Get Received Star List(/api/v2/users/:userId/stars)
- Count User Received Stars(/api/v2/users/:userId/stars/count)

#### Issues
- Get Issue List(/api/v2/issues)
- Add Issue(/api/v2/issues)
- Get Issue(/api/v2/issues/:issueIdOrKey)
- Update Issue(/api/v2/issues/:issueIdOrKey)
- Delete Issue(/api/v2/issues/:issueIdOrKey)

### How to use unsupported API
You can use unsupported API by using BacklogApiClient::Client has methods.

- \#get
- \#post
- \#patch
- \#put
- \#delete
- \#file_upload

But I would be glad if you send Pull Request without to use these methods.

#### example
```ruby
cli = BacklogApiClient::Client.new('joe-re.backlog.jp', '8EnEQMOapDlZHHXPTMfNy8ByikEYXLDdbS1A1htuLNTRtpU7Q7hIP4JY7gEhLyqt')

# get wiki list
cli.get('/api/v2/wikis', { 'projectIdOrKey' => 16931})

# create wiki
cli.post('/api/v2/wikis', {
  'projectId' => 16931,
  'name' => 'add test wiki',
  'content' => 'test'
})
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/backlog-api-client/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
