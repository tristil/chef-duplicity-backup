#
# Author:: Andrew Coulton(<andrew@ingenerator.com>)
# Cookbook Name:: duplicity-backup
# Attribute:: default
#
# Copyright 2013-14, inGenerator Ltd
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# URL for the duplicity source
default['duplicity']['src_url'] = 'http://code.launchpad.net/duplicity/0.6-series/0.6.23/+download/duplicity-0.6.23.tar.gz'

# local directory to place the source in
default['duplicity']['src_dir'] = '/usr/local/src'

# globbing patterns for file backup
default['duplicity']['globbing_file_patterns'] = node['duplicity']['globbing_file_patterns'] || {}

# backup passphrase
default['duplicity']['backup_passphrase'] = nil

# Other environment variables to set for the backup process - will be placed in a secure script
default['duplicity']['duplicity_environment'] = node['duplicity']['duplicity_environment'] || {}

# Configuration for a mysql dump to be run before backing up
default['duplicity']['backup_mysql']      = false
default['duplicity']['mysql']['user']     = 'backup'
default['duplicity']['mysql']['password'] = nil
# Set innodb_only false if you are using any tables with other storage engines
# This will disable the use of the --single-transaction mysqldump mode which will otherwise allow you to backup innodb without long locks
default['duplicity']['mysql']['innodb_only'] = true


# Remote backup destinations - see the duplicity documentation for options
default['duplicity']['db_destination']   = nil
default['duplicity']['file_destination'] = nil

# Set how often a full backup (rather than incremental) should be run
default['duplicity']['full_if_older_than'] = nil

# Set how many full backup sets should be kept
default['duplicity']['keep_n_full']        = nil

# Use S3 european buckets
default['duplicity']['s3-european-buckets'] = true

# The cron command - customise to make this run something else, or to prepend environment vars/loggers/etc
default['duplicity']['cron_command'] = '/usr/local/bin/lockrun --lockfile=/var/run/duplicity_backup.lockrun -- /etc/duplicity/backup.sh'

# Customise the mail recipient - otherwise will be system default
default['duplicity']['mailto'] = nil

# Set the schedule - missing values will be set to '*'
default['duplicity']['schedule']['minute']  = nil
default['duplicity']['schedule']['hour']    = nil
default['duplicity']['schedule']['day']     = nil
default['duplicity']['schedule']['weekday'] = nil
default['duplicity']['schedule']['month']   = nil


