#include "definitions.h"
#include "game.h"
#include <time.h>
int main(int argc, char **argv)
{
  srand(time(NULL));

  if (init_game() != 0)
  {
    SDL_LogError(0, "Failed to start game\n");
    return 1;
  }

  while (1)
  {
    int res = game_loop();
    if (res != 0)
    {
      if (res < 0)
        SDL_LogError(0, "Unexpected error occured\n");
      break;
    }
  }

  if (terminate_game() != 0)
    SDL_LogError(0, "Error while terminating game\n");
}
