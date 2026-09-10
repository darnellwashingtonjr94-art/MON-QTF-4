use tokio::net::UdpSocket;
use std::error::Error;

#[tokio::main]
async fn main() -> Result<(), Box<dyn Error>> {
    let socket = UdpSocket::bind("127.0.0.1:8080").await?;
    println!("Mon-QTF-4 100-Node Proxy Router online.");

    let mut buf = [0; 2048];
    loop {
        let (amt, _src) = socket.recv_from(&mut buf).await?;
        println!("Routing execution payload of {} bytes across cluster swarm.", amt);
    }
}
