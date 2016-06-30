#!/usr/bin/env bats

@test "vagrant installed" {
    run which vagrant
    [ "status" -eq 0 ]
}

@test "packer installed" {
    run which packer
    [ "status" -eq 0 ]
}

@test "ruby installed" {
    run which ruby -v
    [ "status" -eq 0 ]
}

@test "test-kitchen installed" {
    run which kitchen
    [ "status" -eq 0 ]
}

gems=(bundler ffi winrm winrm-fs)
for gem in "${gems[@]}"
do
    @test "$gem installed" {
        run
    }
done
