﻿@{
    AllNodes    = @(
        @{
            NodeName                    = 'localhost'
            PsDscAllowPlainTextPassword = $true
            PsDscAllowDomainUser        = $true
        }
    )

    NonNodeData = @{

        Environment    = @{
            Name             = 'Production'
            ShortName        = 'PRD'
            OrganizationName = "missionpartners.us"
            AlertName = "security_notifications@missionpartners.us"
        } # End Hash Table
        
        Accounts       = @(
            @{
                Workload = 'Exchange'
            }
            @{
                Workload = 'Office365'
            }
            @{
                Workload = 'PowerPlatform'
            }
            @{
                Workload = 'SecurityCompliance'
            }
            @{
                Workload = 'SharePoint'
            }
            @{
                Workload = 'Teams'
            }
            @{
                Workload = 'AzureAD'
            }
            @{
                Workload = 'Intune'
            }
            @{
                Workload = 'OneDrive'
            }
        ) # End hash Table

        Exchange       = @{
            OrganizationalRelationships = @(
                @{
                    Name                  = "missionpartners.us"
                    ArchiveAccessEnabled  = $false
                    DeliveryReportEnabled = $false
                    DomainNames           = @(,"afmpe.onmicrosoft.com")
                    Enabled               = $true
                    FreeBusyAccessEnabled = $true
                    FreeBusyAccessLevel   = "LimitedDetails"
                    MailboxMoveEnabled    = $false
                    MailTipsAccessEnabled = $false
                    MailTipsAccessLevel   = "None"
                    OrganizationContact   = ""
                    PhotosEnabled         = $false
                    TargetApplicationUri  = "outlook.com"
                    TargetAutodiscoverEpr = "https://autodiscover-s.outlook.com/autodiscover/autodiscover.svc/WSSecurity"
                    TargetOwaURL          = ""
                    TargetSharingEpr      = ""
                }
            ) # End Organizational Policies

            AcceptedDomains             = @(
                @{
                    Identity        = "missionpartners.us"
                    DomainType      = 'Authoritative'
                    MatchSubDomains = $false
                    OutboundOnly    = $false
                    Ensure          = 'Present'
                }
            ) # End Accepted Domains

            DKIM                        = @(
                @{
                    Identity               = "missionpartners.us"
                    Enabled                = $true
                    AdminDisplayName       = ''
                    BodyCanonicalization   = 'Relaxed'
                    HeaderCanonicalization = 'Relaxed'
                    KeySize                = 1024
                }
            ) # End DKIM

            InboundConnectors           = @()
            OutboundConnectors          = @()
        } # End Hash Table

        Teams          = @{

            MeetingBroadcastConfiguration = @{
                Identity                            = "Global"
                AllowSdnProviderForBroadcastMeeting = $false
                SdnApiTemplateUrl                   = ""
                SdnApiToken                         = ""
                SdnLicenseId                        = ""
                SdnProviderName                     = ""
                SupportURL                          = "https://support.office.com/home/contact"
            } # End Meeting Broadcast Configuration

            MeetingBroadcastPolicies      = @(
                @{
                    Identity                        = "Global"
                    AllowBroadcastScheduling        = $false
                    AllowBroadcastTranscription     = $true
                    BroadcastAttendeeVisibilityMode = "EveryoneInCompany"
                    BroadcastRecordingMode          = "UserOverride"
                }
            ) # End Meeting Broadcast Policies

            MeetingConfiguration          = @{
                Identity                    = "Global"
                ClientAppSharingPort        = 50040
                ClientAppSharingPortRange   = 20
                ClientAudioPort             = 50000
                ClientAudioPortRange        = 20
                ClientMediaPortRangeEnabled = $true
                ClientVideoPort             = 50020
                ClientVideoPortRange        = 20
                DisableAnonymousJoin        = $false
                EnableQoS                   = $false
            } # End meeting Configurations

            MeetingPolicies               = @(
                @{
                    Identity                                   = "Global"
                    AllowAnonymousUsersToDialOut               = $false
                    AllowAnonymousUsersToStartMeeting          = $false
                    AllowBreakoutRooms                         = $true
                    AllowChannelMeetingScheduling              = $true
                    AllowCloudRecording                        = $false
                    AllowEngagementReport                      = "Disabled"
                    AllowExternalParticipantGiveRequestControl = $true
                    AllowIPAudio                               = $true
                    AllowIPVideo                               = $true
                    AllowMeetingReactions                      = $true
                    AllowMeetNow                               = $true
                    AllowNDIStreaming                          = $false
                    AllowOrganizersToOverrideLobbySettings     = $false
                    AllowOutlookAddIn                          = $true
                    AllowParticipantGiveRequestControl         = $true
                    AllowPowerPointSharing                     = $true
                    AllowPrivateMeetingScheduling              = $true
                    AllowPrivateMeetNow                        = $true
                    AllowPSTNUsersToBypassLobby                = $true
                    AllowRecordingStorageOutsideRegion         = $false
                    AllowSharedNotes                           = $true
                    AllowTranscription                         = $false
                    AllowUserToJoinExternalMeeting             = "Disabled"
                    AllowWhiteboard                            = $true
                    AutoAdmittedUsers                          = "EveryoneInCompanyExcludingGuests"
                    DesignatedPresenterRoleMode                = "EveryoneInCompanyUserOverride"
                    EnrollUserOverride                         = "Disabled"
                    IPAudioMode                                = "EnabledOutgoingIncoming"
                    IPVideoMode                                = "EnabledOutgoingIncoming"
                    LiveCaptionsEnabledType                    = "DisabledUserOverride"
                    MediaBitRateKb                             = 50000
                    MeetingChatEnabledType                     = "Enabled"
                    PreferredMeetingProviderForIslandsMode     = "TeamsAndSfb"
                    RecordingStorageMode                       = "OneDriveForBusiness"
                    ScreenSharingMode                          = "EntireScreen"
                    StreamingAttendeeMode                      = "Disabled"
                    TeamsCameraFarEndPTZMode                   = "Disabled"
                    VideoFiltersMode                           = "AllFilters"
                    WhoCanRegister                             = "EveryoneInCompany"
                }
            ) # End Meeting Policies
        } # End Hash Table

        
        AzureAD = @{
            RoleSettings = @(
                @{
                    Id                                                        = "62e90394-69f5-4237-9190-012177145e10"
                    ActivateApprover                                          = @()
                    ActivationMaxDuration                                     = "PT8H"
                    ActivationReqJustification                                = $true
                    ActivationReqMFA                                          = $true
                    ActivationReqTicket                                       = $false
                    ActiveAlertNotificationDefaultRecipient                   = $true
                    ActiveAlertNotificationOnlyCritical                       = $False
                    ActiveApproveNotificationAdditionalRecipient              = @()
                    ActiveApproveNotificationDefaultRecipient                 = $true
                    ActiveApproveNotificationOnlyCritical                     = $false
                    ActiveAssigneeNotificationAdditionalRecipient             = @()
                    ActiveAssigneeNotificationDefaultRecipient                = $true
                    ActiveAssigneeNotificationOnlyCritical                    = $false
                    ApprovaltoActivate                                        = $false
                    AssignmentReqJustification                                = $true
                    AssignmentReqMFA                                          = $false
                    Displayname                                               = "Global Administrator"
                    ElegibilityAssignmentReqJustification                     = $false
                    ElegibilityAssignmentReqMFA                               = $false
                    EligibleAlertNotificationDefaultRecipient                 = $true
                    EligibleAlertNotificationOnlyCritical                     = $false
                    EligibleApproveNotificationAdditionalRecipient            = @()
                    EligibleApproveNotificationDefaultRecipient               = $true
                    EligibleApproveNotificationOnlyCritical                   = $false
                    EligibleAssigneeNotificationAdditionalRecipient           = @()
                    EligibleAssigneeNotificationDefaultRecipient              = $true
                    EligibleAssigneeNotificationOnlyCritical                  = $false
                    EligibleAssignmentAlertNotificationDefaultRecipient       = $true
                    EligibleAssignmentAlertNotificationOnlyCritical           = $false
                    EligibleAssignmentAssigneeNotificationAdditionalRecipient = @()
                    EligibleAssignmentAssigneeNotificationDefaultRecipient    = $true
                    EligibleAssignmentAssigneeNotificationOnlyCritical        = $false
                    ExpireActiveAssignment                                    = "P15D"
                    ExpireEligibleAssignment                                  = "P365D"
                    PermanentActiveAssignmentisExpirationRequired             = $true
                    PermanentEligibleAssignmentisExpirationRequired           = $true
                }
            ) # End Role Settings
        } # End Hash Table

        Intune = @{
            
        }

        OneDrive = @{

        }
    }
}