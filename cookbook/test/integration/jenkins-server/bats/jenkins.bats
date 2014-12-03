#!/usr/bin/env bats
# vi: se ft=sh:

@test "docker is installed" {
    run docker version
    [ $status -eq 0 ]
}
