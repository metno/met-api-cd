#!/usr/bin/env bats
# vi: se ft=sh:


@test "activator link exists" {
    run test -L /usr/local/bin/activator
    [ $status -eq 0 ]
}

@test "activator link target" {
    run test -e /usr/local/bin/activator
    [ $status -eq 0 ]
}
