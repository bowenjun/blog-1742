---
title: Pipeline add ssh
---

[https://docs.gitlab.com/ee/ci/ssh_keys/](https://docs.gitlab.com/ee/ci/ssh_keys/)

```yml
before_script:
    - 'command -v ssh-agent >/dev/null || ( apt-get update -y && apt-get install openssh-client -y )'
    - eval $(ssh-agent -s)
    - echo "$SSH_PRIVATE_KEY" | tr -d '\r' | ssh-add -
    - mkdir -p ~/.ssh
    - chmod 700 ~/.ssh
    - ssh-keyscan code.siemens.com >> ~/.ssh/known_hosts
    - chmod 644 ~/.ssh/known_hosts
```