#!/usr/bin/env bats
# vi: se ft=sh:

@test "Jenkins is installed" {
    run test -f /usr/share/jenkins/jenkins.war
    [ $status -eq 0 ]
}

@test "Jenkins is running on port 8080" {
    run curl -i http://localhost:8080
    [ $status -eq 0 ]
}
