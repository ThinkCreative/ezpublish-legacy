<?php
//
// Definition of eZLog class
//
// Created on: <17-Mar-2003 11:00:54 wy>
//
// ## BEGIN COPYRIGHT, LICENSE AND WARRANTY NOTICE ##
// SOFTWARE NAME: eZ publish
// SOFTWARE RELEASE: 3.7.x
// COPYRIGHT NOTICE: Copyright (C) 1999-2006 eZ systems AS
// SOFTWARE LICENSE: GNU General Public License v2.0
// NOTICE: >
//   This program is free software; you can redistribute it and/or
//   modify it under the terms of version 2.0  of the GNU General
//   Public License as published by the Free Software Foundation.
//
//   This program is distributed in the hope that it will be useful,
//   but WITHOUT ANY WARRANTY; without even the implied warranty of
//   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//   GNU General Public License for more details.
//
//   You should have received a copy of version 2.0 of the GNU General
//   Public License along with this program; if not, write to the Free
//   Software Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
//   MA 02110-1301, USA.
//
//
// ## END COPYRIGHT, LICENSE AND WARRANTY NOTICE ##
//

/*! \defgroup eZUtils Utility classes */

/*!
  \class eZLog ezlog.php
  \ingroup eZUtils
*/


include_once( "lib/ezutils/classes/ezsys.php" );
define( "EZ_MAX_LOGROTATE_FILES", 3 );
define( "EZ_MAX_LOGFILE_SIZE", 200*1024 );
class eZLog
{
    /*!
      Creates a new log object.
    */
    function eZLog( )
    {
    }

    /*!
     \public
     Writes a message $message to a given file name $name and directory $dir for logging
    */
    function write( $message, $logName = 'common.log', $dir = 'var/log' )
    {
        $fileName = $dir . '/' . $logName;
        if ( !file_exists( $dir ) )
        {
            include_once( 'lib/ezfile/classes/ezdir.php' );
            eZDir::mkdir( $dir, 0775, true );
        }
        $oldumask = @umask( 0 );

        $fileExisted = @file_exists( $fileName );
        if ( $fileExisted and
             filesize( $fileName ) > eZLog::maxLogSize() )
        {
            if ( eZLog::rotateLog( $fileName ) )
                $fileExisted = false;
        }

        $logFile = @fopen( $fileName, "a" );
        if ( $logFile )
        {
            $time = strftime( "%b %d %Y %H:%M:%S", strtotime( "now" ) );
            $logMessage = "[ " . $time . " ] $message\n";
            @fwrite( $logFile, $logMessage );
            @fclose( $logFile );
            if ( !$fileExisted )
                @chmod( $fileName, 0666 );
            @umask( $oldumask );
        }
    }

    /*!
     \private
     Writes file name $name and storage directory $dir to storage log
    */
    function writeStorageLog( $name, $dir = false )
    {
        $ini =& eZINI::instance();
        $varDir = $ini->variable( 'FileSettings', 'VarDir' );
        $logDir = $ini->variable( 'FileSettings', 'LogDir' );
        $logName = 'storage.log';
        $fileName = $varDir . '/' . $logDir . '/' . $logName;
        if ( !file_exists( $varDir . '/' . $logDir ) )
        {
            include_once( 'lib/ezfile/classes/ezdir.php' );
            eZDir::mkdir( $varDir . '/' . $logDir, 0775, true );
        }
        $oldumask = @umask( 0 );

        $fileExisted = @file_exists( $fileName );
        if ( $fileExisted and
             filesize( $fileName ) > eZLog::maxLogSize() )
        {
            if ( eZLog::rotateLog( $fileName ) )
                $fileExisted = false;
        }

        if ( $dir !== false )
        {
            $dir = preg_replace( "#/$#", "", $dir );
            $dir .= "/";
        }
        else
        {
            $dir = "";
        }

        $logFile = @fopen( $fileName, "a" );
        if ( $logFile )
        {
            $time = strftime( "%b %d %Y %H:%M:%S", strtotime( "now" ) );
            $logMessage = "[ " . $time . " ] [" . $dir . $name . "]\n";
            @fwrite( $logFile, $logMessage );
            @fclose( $logFile );
            if ( !$fileExisted )
                @chmod( $fileName, 0666 );
            @umask( $oldumask );
        }
    }

    /*!
     \static
     \return the maxium size for a log file in bytes.
    */
    function maxLogSize()
    {
        $maxLogSize =& $GLOBALS['eZMaxLogSize'];
        if ( isset( $maxLogSize ) )
            return $maxLogSize;
        return EZ_MAX_LOGFILE_SIZE;
    }

    /*!
     \static
     Sets the maxium size for a log file to \a $size.
    */
    function setMaxLogSize( $size )
    {
        $GLOBALS['eZMaxLogSize'] = $size;
    }

    /*!
     \static
     \return the maxium number of logrotate files to keep.
    */
    function maxLogrotateFiles()
    {
        $maxLogrotateFiles =& $GLOBALS['eZMaxLogrotateFiles'];
        if ( isset( $maxLogrotateFiles ) )
            return $maxLogrotateFiles;
        return EZ_MAX_LOGROTATE_FILES;
    }

    /*!
     \static
     Rotates logfiles so the current logfile is backed up,
     old rotate logfiles are rotated once more and those that
     exceed maxLogrotateFiles() will be removed.
     Rotated files will get the extension .1, .2 etc.
    */
    function rotateLog( $fileName )
    {
        $maxLogrotateFiles = eZLog::maxLogrotateFiles();
        for ( $i = $maxLogrotateFiles; $i > 0; --$i )
        {
            $logRotateName = $fileName . '.' . $i;
            if ( @file_exists( $logRotateName ) )
            {
                if ( $i == $maxLogrotateFiles )
                {
                    @unlink( $logRotateName );
                }
                else
                {
                    $newLogRotateName = $fileName . '.' . ($i + 1);
                    @rename( $logRotateName, $newLogRotateName );
                }
            }
        }
        if ( @file_exists( $fileName ) )
        {
            $newLogRotateName = $fileName . '.' . 1;
            @rename( $fileName, $newLogRotateName );
            return true;
        }
        return false;
    }

    /*!
     \static
     Sets the maxium number of logrotate files to keep to \a $files.
    */
    function setLogrotateFiles( $files )
    {
        $GLOBALS['eZMaxLogrotateFiles'] = $filse;
    }

}

?>
