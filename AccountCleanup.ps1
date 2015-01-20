$users = Get-ChildItem C:\Users


####################################################################################################################################
#  Remove any files and folders inside a users default home directory folder, leaving the folder intact, excludes certain accounts #
####################################################################################################################################


foreach ($user in $users){

	if ( $user.Name -ne 'Public' -And $user.Name -ne 'sota' -And $user.Name -ne 'UpdatusUser' -And $user.Name -ne 'Administrator' )

	{
		
		$folder = "C:\users\" + $user + "\Desktop\*"
		#	echo $folder
		Remove-Item $folder -Recurse -Force -ErrorAction silentlycontinue

		$folder = "C:\users\" + $user + "\Documents\*"
		#	echo $folder
		Remove-Item $folder -Recurse -Force -ErrorAction silentlycontinue
		
		$folder = "C:\users\" + $user + "\Downloads\*"
		#	echo $folder
		Remove-Item $folder -Recurse -Force -ErrorAction silentlycontinue

		$folder = "C:\users\" + $user + "\Music\*"
		#	echo $folder
		Remove-Item $folder -Recurse -Force -ErrorAction silentlycontinue
		
		$folder = "C:\users\" + $user + "\Pictures\*"
		#	echo $folder
		Remove-Item $folder -Recurse -Force -ErrorAction silentlycontinue
		
		$folder = "C:\users\" + $user + "\Videos\*"
		#	echo $folder
		Remove-Item $folder -Recurse -Force -ErrorAction silentlycontinue
		
		$folder = "C:\users\" + $user + "\Contacts\*"
		#	echo $folder
		Remove-Item $folder -Recurse -Force -ErrorAction silentlycontinue
		
		$folder = "C:\users\" + $user + "\links\*"
		#	echo $folder
		Remove-Item $folder -Recurse -Force -ErrorAction silentlycontinue
		
		$folder = "C:\users\" + $user + "\Saved Games\*"
		#	echo $folder
		Remove-Item $folder -Recurse -Force -ErrorAction silentlycontinue
		
		$folder = "C:\users\" + $user + "\Searches\*"
		#	echo $folder
		Remove-Item $folder -Recurse -Force -ErrorAction silentlycontinue
		
		$folder = "C:\users\" + $user + "\Favorites\*"
		#	echo $folder
		Remove-Item $folder -Recurse -Force -ErrorAction silentlycontinue



		##################################################################################
		#  Remove any folders and files other than the default folders in the users home directory #
		##################################################################################


		$other_folders = Get-ChildItem C:\users\$user

		foreach	($other_folder in $other_folders)
		{
			
			if ( $other_folder.Name -ne 'Contacts' -And $other_folder.Name -ne 'Desktop' -And $other_folder.Name -ne 'Documents' -And $other_folder.Name -ne 'Downloads' -And $other_folder.Name -ne 'Favorites' -And $other_folder.Name -ne 'Links' -And $other_folder.Name -ne 'Music' -And $other_folder.name -ne 'Pictures' -And $other_folder.Name -ne 'Saved Games' -And $other_folder.Name -ne 'Searches' -And $other_folder.Name -ne 'Videos'  )
			{
				$delete_folder = "C:\users\" + $user + "\" + $other_folder
				echo $delete_folder
				Remove-Item $delete_folder -Recurse -Force -ErrorAction silentlycontinue	
			}

		}


		





	}


}