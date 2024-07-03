# PowerShell-Logging-Library

This library can be imported into a PowerShell script to add lower impact logging. Most logging writes each entry to file, one at a time using a cmdlet like Out-File. This script uses a System.Collections.Concurrent.ConcurrentQueue object to enqueue entries and then dequeue's log entries to file using a stream writer once enough entries have built up. No more than 250ms is spent writing to log at a time, until logging is closed.
