# PowerShell-Logging-Library

This library can be imported into a PowerShell script to add lower impact logging. Most logging writes each entry to file, one at a time, using a cmdlet like Out-File. This script uses a System.Collections.Concurrent.ConcurrentQueue object to enqueue log entries and then dequeue's log entries, in bulk, to a log file using a stream writer once enough entries have built up. No more than 250ms is spent writing to log at a time until logging is closed; at which time, all entries are committed to file. This lessens the performance impact of constantly opening and closing the log file while minimzing the memory footprint.

This logging works best with PowerShell 7.3+, which supports the [clean block](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_functions_advanced_methods?view=powershell-7.4). Add Close-Logging to the clean{} block to prevent logs from being lost if the script exits pre-maturely.

# Usage

Comming soon(TM).
