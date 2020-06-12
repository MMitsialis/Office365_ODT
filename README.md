# Office365_ODT

Contains a set of Office 365 ODT Configuration XML files for:
  - Replica Downloads
  - Base Installations
  - Addition of optional components (Visio)

Inlcuded is a set of script to switch an exiting installation to a new channel.

This is a very basic set of configuration, use is as-is with no warannties. YMMV

The files follow the naming convention below

`<Verb>`-`<Product>`-`<Channel>`-`<Architecture>`[-`<InstallMediaSource>`_`<UpdateMediaSource>`].`<Extension>`

`<Verb>`:
  - Change -- Change an exisiting instance
  - Download -- Download an offline installation media packages
  - Install -- Install an instance
  - Update -- Refresh offline installation medai packages

`<Product>`:
	- Office365
	- Office365_SfB   (Office365 with Skype4Business)
	- Office365_SfB_VisioPro (Office365 with Visio Professional and Skype4Business)
	- Office365_VisioPro (Office365 with Visio Professional)

`<Channel>`:
	Channels is derived from the [Microsoft365 Apps Channels Update Document](https://docs.microsoft.com/en-us/DeployOffice/update-channels-changes)

	- BetaChannel
	- CurrentPreview
	- Current
	- MonthlyEnterprise
	- SemiAnnualPreview
	- SemiAnnual

`<Architecture>`:
	- x64
	- X86

`<InstallMediaSource>`_`<UpdateMediaSource>`:
	- CDN_CDN (Microsoft Public CDN)
	- CM_CM (Configuration Manager)
	- UNC_CDN (Install Internal UNC, Update CDN )
	- CDN_UNC (Install CDN, Update Internal UNC  )

	- CDN (Microsoft Public CDN)
	- UNC (Internal UNC )
	- CM (Configuration Manager)
