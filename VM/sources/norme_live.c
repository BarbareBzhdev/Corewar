/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   norme_live.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: aiwanesk <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2017/03/17 15:56:01 by aiwanesk          #+#    #+#             */
/*   Updated: 2017/03/17 15:58:07 by aiwanesk         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "core.h"

void			norme_live(t_env *env)
{
	env->cycle_to_die -= CYCLE_DELTA;
	env->nblive = 0;
}