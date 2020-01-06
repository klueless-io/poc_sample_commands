#include "poc_sample_commands.h"

VALUE rb_mPocSampleCommands;

void
Init_poc_sample_commands(void)
{
  rb_mPocSampleCommands = rb_define_module("PocSampleCommands");
}
