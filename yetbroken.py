def parse_cmd_line(fn):
    """Parse the command line options and pass them to the application"""

    def processor(*args, **kwargs):
        usage = """
                %prog [options] <source> <target>
                source/target format: mysql://user:pass@host:port/database"""
        description = """
                       A MySQL Schema Synchronization Utility
                      """
        parser = optparse.OptionParser(usage=usage,
                                        description=description)

        parser.add_option("-V", "--version",
                          action="store_true",
                          dest="show_version",
                          default=False,
                          help=("show version and exit."))

        parser.add_option("-r", "--revision",
                        action="store_true",
                        dest="version_filename",
                        default=False,
                        help=("increment the migration script version number "
                              "if a file with the same name already exists."))

        parser.add_option("-a", "--sync-auto-inc",
                          dest="sync_auto_inc",
                          action="store_true",
                          default=False,
                          help="sync the AUTO_INCREMENT value for each table.")

        parser.add_option("-c", "--sync-comments",
                          dest="sync_comments",
                          action="store_true",
                          default=False,
                          help=("sync the COMMENT field for all "
                                "tables AND columns"))

        parser.add_option("--tag",
                         dest="tag",
                         help=("tag the migration scripts as <database>_<tag>."
                               " Valid characters include [A-Za-z0-9-_]"))

        parser.add_option("--output-directory",
                          dest="output_directory",
                          default=os.getcwd(),
                          help=("directory to write the migration scrips. "
                                 "The default is current working directory. "
                                 "Must use absolute path if provided."))

        parser.add_option("--log-directory",
                          dest="log_directory",
                          help=("set the directory to write the log to. "
                                "Must use absolute path if provided. "
                                "Default is output directory. "
                                "Log filename is schemasync.log"))

        options, args = parser.parse_args(sys.argv[1:])


        if options.show_version:
            print((APPLICATION_NAME, __version__))
            return 0

        if (not args) or (len(args) != 2):
            parser.print_help()
            return 0

        return fn(*args, **dict(version_filename=options.version_filename,
                                 output_directory=options.output_directory,
                                 log_directory=options.log_directory,
                                 tag=options.tag,
                                 sync_auto_inc=options.sync_auto_inc,
                                 sync_comments=options.sync_comments))
    return processor
