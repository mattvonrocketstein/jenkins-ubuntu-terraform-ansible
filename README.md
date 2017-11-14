<table>
  <tr>
    <td colspan=2><strong>
      jenkins-ubuntu-terraform-ansible
      </strong>&nbsp;&nbsp;&nbsp;&nbsp;
      <small><small>
          <a href=#Overview>Overview</a> |
          <a href=#Design>Design</a> |
          <a href=#Workflows>Workflows</a> |
          <a href=#TODO>TODO</a> |
      </small><small>
    </td>
  </tr>
  <tr>
    <td width=15%><img src=img/icon.png style="width:150px"></td>
    <td>
    This repo describes infracode for bootstrapping a dockerized Jenkins on EC2 with Ansible and Terraform.
    </td>
  </tr>
</table>

## Overview

## Design

## Prerequisites

Valid named AWS profiles should already be setup in your `~/.aws/credentials` file.  We'll assume in the rest of this guide that the profile you want to use is called `MY_PROFILE`.  Make sure the name of the profile matches `aws_profile` in `variables.tf`.  The correct format for the entry in your credentials file is as follows:

    [MY_PROFILE]
    aws_access_key_id=REDACTED
    aws_secret_access_key=REDACTED


You'll also need local copies of `terraform`, `ansible`, and `jq`.  Recent versions in general should work fine, but for your consideration my (confirmed working) version info follows:

    $ terraform --version
    Terraform v0.9.11

    $ ansible --version
    ansible 2.3.2.0

    $ jq --version
    jq-1.5

Installation instructions/downloads can be found [here for terraform](https://www.terraform.io/downloads.html), [here for ansible](http://docs.ansible.com/ansible/latest/intro_installation.html) and [here for jq](https://stedolan.github.io/jq/download/).  More to the point, ansible can be installed easily with `pip install ansible==2.3.2.0`, and jq with `brew install jq`

Briefly, `terraform` is responsible for creating infrastructure, `ansible` for provisioning infrastructure, and the `jq` tool helps parse JSON output from terraform to provide input for ansible.

## Workflows

## TODO
