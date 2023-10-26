#include "IO.hpp"
#include "Server.hpp"
#include "Client.hpp"
#include "Channel.hpp"

bool	g_status = TRUE;

static void sigintHandler(int signum) 
{
    if (signum == SIGINT)
    	g_status = FALSE;
}

int main(int argc, char *argv[])
{
	if (argc != 3 && (argc != 4 || (argc == 4 && strcmp(argv[3], "DEBUG") != 0)))
	{
		std::cout << BACK_RED << BLACK << "ERROR: ./ircserv [host:port_network:password_network] <port> <password>" << RESET << std::endl;
		return (1);
	}

	bool DEBUG = (argc == 4 && strcmp(argv[3], "DEBUG") == 0) ? TRUE : FALSE;
	
	signal(SIGINT, sigintHandler);

	IO IO(argv[1], argv[2], DEBUG);
	
	while (g_status)
	{
		try
		{
			IO.run();
			usleep(1000);
		}
		catch (std::exception &e)
		{
			std::cout << e.what() << std::endl;
		}
	}

	std::cout << "Server is shutting down..." << std::endl;
	IO.stop();

	return (0);
}
