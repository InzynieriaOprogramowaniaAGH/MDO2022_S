FROM rust:latest 

WORKDIR /solanaDir
RUN sh -c "$(curl -sSfL https://release.solana.com/stable/install)"	
ENV PATH="/root/.local/share/solana/install/active_release/bin:$PATH"  
RUN solana config set --url "localhost" 
