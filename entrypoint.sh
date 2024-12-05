cd /workspace

echo "Downloading the models..."
ls -l

# If the llava file is not present, download it
# if [ ! -f "llava-v1.5-7b-q4.llamafile" ]; then
#     wget -O llava-v1.5-7b-q4.llamafile https://huggingface.co/Mozilla/llava-v1.5-7b-llamafile/resolve/main/llava-v1.5-7b-q4.llamafile
# fi
# chmod +x llava-v1.5-7b-q4.llamafile

if [ ! -f "whisper-large-v3.llamafile" ]; then
    wget -O whisper-large-v3.llamafile https://huggingface.co/Mozilla/whisperfile/resolve/main/whisper-large-v3.llamafile
fi
chmod +x whisper-large-v3.llamafile

if [ ! -f "mistral-7b-instruct-v0.2.Q4_0.llamafile" ]; then
    wget -O mistral-7b-instruct-v0.2.Q4_0.llamafile https://huggingface.co/Mozilla/Mistral-7B-Instruct-v0.2-llamafile/resolve/main/mistral-7b-instruct-v0.2.Q4_0.llamafile
fi
chmod +x mistral-7b-instruct-v0.2.Q4_0.llamafile

cd ../


# Start the server
echo "Starting the server..."


python3.11 -u /handler.py