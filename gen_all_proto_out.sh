# Checking whether we are in the required directory

PROTOBUF_DIR="./protobufs"
PROTOC_OUT_DIR="./protoc_out_files"

if [ ! -d "$PROTOBUF_DIR" ] || [ ! -d "$PROTOC_OUT_DIR" ];
then
   echo "\033[33m Error: One of protobufs or protoc_out files missing"
   exit 1
else
   echo "\033[32m Both files exist..."
fi

# Run command to compile all proto files
  python3 -m grpc_tools.protoc -I ./protobufs --python_out=./protoc_out_files --grpc_python_out=./protoc_out_files ./protobufs/*.proto 

#cd protoc_out_files/

for file in *_grpc.py; do
   filename="$file"

   # Extract only the required part from the filename
   newfilename=$(echo "$filename"| cut -d'.' -f 1 | rev | cut -c 6- | rev)

   # Replace the occurence of _ with __ in the name to be used while insertion
   changednewfile=$(echo "$newfilename" | awk '{ gsub("_", "__", $1) } 1')

   # Replacing the import line with the required line
   sed -i "/import ${newfilename}/c\import protoc_out_files.${newfilename} as ${changednewfile}" "$file"

   # Printing that the protoc_out_files changed successfully.
   echo "\033[32m Successfully changed protoc_out_files..."
done
