Feature: Executed EIC Form Storage: The backup storage location will only have Bareos and System Admin service Account permission.
Database back up location: CHPC
HIPAA Filesystem NFS mounted to:
"/uufs/chpc.utah.edu/common/HIPA
A/proj_redcap/prod/backup/daily/"
Permissions are set to drwxrws---+ 6
root proj_redcap
Sftp file vault storage location: CHPC
HIPAA Filesystem to: "
/uufs/chpc.utah.edu/common/HIPAA
/proj_redcap_vault/"
Permissions are set to drwxrws---+ 6
root proj_redcap
Sftp service account
redcap@redcap.ctsi.utah.edu
Password maintained as a directory account controlled by systems CHPC administartors and BMIC Director of Operations. Only REDCap administrators and CHPC staff have permissions to write to this directory. Sub directories in proj_redcap are used to store dev/test/prod for daily database dumps. Subdirectories of dev/test/prod of the project_redcap_vault are used for the Part 11 sftp vault document copies.
FRS: The backup storage location will have limited access only to administrators of the CHPC protected environment.
CS: Archival object backup storage for database exports and for virtual machine file systems are provided by local CEPH storage implementation utilizing Amazon S3 API protection standards restricted to CHPC systems administrative staff who control usage of the Access Key and Secret Key to initiate the archival data backup copy. Following the specified Bareos backup schedule.

  As a REDCap administrator
  I want to see that the backup storage location will only have Bareos and System Admin service Account permission.
  #This feature is to be run completely MANUALLY on the REDCap Shadow instance

  Scenario: D.100.1.2000.100 Access permissions for backup storage location
    #FUNCTIONAL REQUIREMENT
    #ACTION
    Given I access Box
    And I navigate to the folder "BMIC Operations > REDCap > Part11-Validation > Validation Documentation > Transition to RSVC > Utah Tier D Release > Installation Qualification Testing (IQ) > IQ evidence and documents"
    And I open the file "REDCap Business Risk Assessment Memo - signed.pdf"
    Then I should have a latest downloaded "pdf" file that contains the content below:
    ```
    REDCap Business Risk Assessment Memo

    The current user permission verification strategy is gathering permission sets for each administrator within the CHPC group. This strategy is not feasible as the administrators within the CHPC group change periodically, and the permissions set may become obsolete and significantly deviate between subsequent verifications. The proposed mitigation to this business risk is identifying the CHPC group's role in REDCap backup and restoration. CHPC is an independent group tasked to perform REDCap data backup and restore. The CHPC systems administrators function as a core group with full admin access to maintain the storage and compute resources in the protected environment where REDCap resides.

    The following are the policies and procedures followed at the CHPC group's end to perform the backup and restore (if and whenever needed) for production data. Back up functionality is enabled by CHPC systems administrators installing the client software on the REDCap host systems. Restore requests for any part of the filesystem storage is requested to the systems administrator group at CHPC via a service ticket sent to helpdesk@chpc.utah.edu where the request is processed to restore files from the archive backup CEPH (https://docs.ceph.com/en/quincy/architecture/) object storage and restored to a location accessible to the CTSI REDCap administrators in the protected environment REDCap project file space or restored to a REDCap host where appropriate. Once restored the CTSI REDCap administrators validate and restore the files to the appropriate operational location.
    ```

  Scenario: D.100.1.2000.200 Access permissions for REDCap system storage location
    Given I open a new terminal window
    And I SSH to "redwood.chpc.utah.edu"
    And I SSH to "redcap-r9.ctsi.utah.edu"
    And I CD to "/var/www/html/redcap01.brisc.utah.edu/ccts/redcap"
    And I run the command "ls -lah"
    Then I should see "drwxr-xr-x.  47 root root     4.0K Sep  9 10:29 ."
    Then I should see "drwxr-xr-x.   4 root root       37 Oct  5  2020 .."
    Then I should see "drwxr-xr-x.   3 root root       35 Sep  3  2020 api"
    Then I should see "-rw-rw-rw-.   1 root root      425 Sep  3  2020 cron.php"
    Then I should see "-rw-r--r--.   1 root root     2.6K Jan 23  2025 database.php"
    Then I should see "drwxr-xr-x.   2 root root       24 Oct  7  2009 edocs"
    Then I should see "-rw-rw-rw-.   1 root root      425 Sep  3  2020 ehr.php"
    Then I should see "-rw-r--r--.   1 root root     9.7K Oct 27  2022 hook_functions.php"
    Then I should see "drwxrwxr-x.   3 root chpcmgmt   21 Dec 21  2022 hooks"
    Then I should see "drwxr-xr-x.   3 root root       22 Aug 11  2014 images"
    Then I should see "-rw-rw-rw-.   1 root root      417 Sep  3  2020 index.php"
    Then I should see "-rw-r--r--.   1 root root     1.5K Dec 28  2017 install.php"
    Then I should see "lrwxrwxrwx.   1 root root       61 Jan 23  2025 languages -> /var/www/html/redcap01.brisc.utah.edu/redcap/common/languages"
    Then I should see "drwxrwxrwx. 362 root root      16K Oct  9 11:04 modules"
    Then I should see "drwxrwxr-x.   5 root chpcmgmt  184 May 30 11:44 plugins"
    Then I should see "-rw-r--r--.   1 root root     6.0K May  4  2024 redcap_connect.php"
    Then I should see "-rw-r--r--.   1 root root     4.7K Jan 27  2022 redcap_redirect.php"
    Then I should see "drwxr-xr-x.   2 root root       23 Sep  3  2020 surveys"
    Then I should see "drwxrwxrwx.   3 root root     260K Oct 21 17:18 temp"
    Then I should see "-rw-rw-rw-.   1 root root     1.2K Sep  3  2020 upgrade.php"

#END
