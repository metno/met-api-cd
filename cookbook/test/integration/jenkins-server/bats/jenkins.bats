#!/usr/bin/env bats
# vi: se ft=sh:

#
# Supplementary tests; Jenkins is tested in the met-jenkins cookbook.
#

@test "docker is installed" {
    run docker version
    [ $status -eq 0 ]
}
