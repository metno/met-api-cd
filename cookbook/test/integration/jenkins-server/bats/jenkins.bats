#!/usr/bin/env bats
# vi: se ft=sh:

@test "Jenkins is installed" {
    run test -f /usr/share/jenkins/jenkins.war
    [ $status -eq 0 ]
}

@test "Jenkins is running on port 8080" {
    run curl -f http://localhost:8080
    [ $status -eq 0 ]
}

@test "nginx is installed" {
    run which nginx
    [ $status -eq 0 ]
}

@test "nginx is proxying to Jenkins" {
    run curl -f http://localhost
    [ $status -eq 0 ]
    curl -f http://localhost | {
        run grep Jenkins
        [ $status -eq 0 ]
    }
}

@test "docker is installed" {
    run docker version
    [ $status -eq 0 ]
}
