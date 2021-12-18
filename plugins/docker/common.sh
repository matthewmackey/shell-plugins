#------------------------------------------------------------------------------#
# [docker:aliases:sh] {{{                                                      #
#------------------------------------------------------------------------------#
  # attach
  # alias da="docker attach -it"

  # build
  alias db="docker build"

  # cp
  alias dcp="docker cp"

  # create
  alias dcr="docker create"

  # events
  alias devents="docker events"

  # images
  alias di="cl; docker images"

  # import
  alias dimp="docker import"

  # info/inspect
  alias dif="docker info"
  alias din="docker inspect"

  # load
  alias dlo="docker load"

  # login/logout
  alias dlgn="docker login"
  alias dlgt="docker logout"

  # ps
  alias dp="cl; docker ps"
  alias dpa="cl; docker ps -a"
  alias dpaf="cl; docker ps -a --format 'table {{.names}}\t{{.image}}\t{{.status}}\t{{.ports}}'"
  alias dpf="cl; docker ps --format 'table {{.names}}\t{{.image}}\t{{.status}}\t{{.ports}}'"
  alias dpsinfo="docker ps -q |xargs docker inspect --format '{{ printf \"%s\t\t|%s\t|%s\n\" .name .config.hostname .hostconfig.networkmode }}'"

  # run
  alias dru="docker run"

  # search
  alias dsearch="docker search"

  # stats
  alias dsta="docker stats"

  # version
  alias dv="docker version"

# }}} docker:aliases


#------------------------------------------------------------------------------#
# [docker:functions:sh] {{{                                                    #
#------------------------------------------------------------------------------#
if command -v fzf >/dev/null && command -v sed >/dev/null;
then

  __docker_ps() {
    local _cmd=$1
    shift
    local _args=$@

    local _cid
    _cid=$(docker ps | sed 1d | fzf | awk '{print $1}')

    [ -n "$_cid" ] && docker $_cmd "$_cid"
  }

  __docker_ps_multi() {
    local _cmd=$1
    shift
    local _args=$@

    local _cids
    _cids=$(docker ps | sed 1d | fzf --multi | awk '{print $1}')

    [ -n "$_cids" ] && docker $_cmd "$_cids"
  }

  __docker_images() {
    local _cmd=$1
    shift
    local _args=$@

    local _cid
    _cid=$(docker images | sed 1d | fzf | awk '{print $3}')

    [ -n "$_cid" ] && docker $_cmd "$_cid"
  }

  __docker_images_multi() {
    local _cmd=$1
    shift
    local _args=$@

    local _cids
    _cids=$(docker images | sed 1d | fzf | awk '{print $3}')

    [ -n "$_cids" ] && docker $_cmd "$_cids"
  }

  # single-selection
  da()    { __docker_ps attach $@ ; }
  dco()   { __docker commit $@ ; }
  ddi()   { __docker diff $@ ; }
  dexp()  { __docker export $@ ; }
  dlogs() { __docker_ps logs $@ ; }
  dprt()  { __docker_ps port $@ ; }
  deti()  { __docker_ps exec -it $@ ; }
  drn()   { __docker_ps rename $@ ; }
  dtop()  { __docker_ps top $@ ; }

  # multi-selection
  dk()   { __docker_ps_multi kill $@ ; }
  drst() { __docker_ps_multi restart $@ ; }
  drm()  { __docker_ps_multi rm $@ ; }
  dpau() { __docker_ps_multi pause $@ ; }
  dst()  { __docker_ps_multi start $@ ; }
  dstp() { __docker_ps_multi stop $@ ; }
  dunp() { __docker_ps_multi unpause $@ ; }
  dupd() { __docker_ps_multi update $@ ; }
  dw()   { __docker_ps_multi wait $@ ; }


  # single-selection
  dh()    { __docker_images history $@ ; }
  dpush() { __docker_images push $@ ; }
  dtag()  { __docker_images tag $@ ; }

  # multi-selection
  dsa()   { __docker_images_multi save $@ ; }
  drmi()  { __docker_images_multi rmi $@ ; }
fi

# }}} docker:functions


#------------------------------------------------------------------------------#
# [docker-compose:aliases:sh] {{{                                              #
#------------------------------------------------------------------------------#
  alias dc="docker-compose"

  alias dcb="docker-compose build"
  alias dcu="docker-compose up"
  alias dcud="docker-compose up -d"

  alias dcrm"docker-compose rm"
  alias dcrms"docker-compose rm -s"
  alias dcrmsf"docker-compose rm -s -f"
# }}} docker-compose:aliases

# vim: set ft=sh foldmarker={{{,}}} foldmethod=marker foldlevel=0 :
