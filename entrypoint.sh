cd /workspace

echo "Downloading the models..."
ls -l

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


# python3.11 -u /handler.py

# nohup ./workspace/whisper-large-v3.llamafile --host 0.0.0.0 --port 4000 --gpu nvidia > whsiper.log 2>&1 &
# # nohup ./workspace/mistral-7b-instruct-v0.2.Q4_0.llamafile -ngl 999 --host 0.0.0.0 --port 4001 > mistral.log 2>&1 &
# nohup infinity_emb v2 --model-id BAAI/bge-m3 --port 4002 > infinity.log 2>&1 &

./mistral-7b-instruct-v0.2.Q4_0.llamafile -ngl 999 --host 0.0.0.0 --port 4001