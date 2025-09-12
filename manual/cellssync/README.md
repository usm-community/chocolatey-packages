# CellsSync

Cells Sync is a desktop synchronization client for Pydio Cells server.

## Features

- 100% GO
- Windows, MacOSX, Linux
- Realtime propagation of changes _(when your local machine can connect to your server)_
- Configurable sync direction (bi-directional / unidirectional)
- Selective Folders synchronization
- Supports various types of end points for syncing (any source/target can be combined):
  - Cells Server (over HTTP/HTTPS)
  - Local Folder
  - Local Cells server (accessed directly if deployed inside the microservices mesh)
  - S3-compatible storage service (tested with AWS S3)
  - BoltDB storage (used for storing tree snapshots)
  - Cells gRPC indexation services (implementing NodeProvider/NodeReceiver gRPC endpoints).