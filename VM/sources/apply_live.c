/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   apply_live.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: aiwanesk <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2017/03/03 15:09:42 by aiwanesk          #+#    #+#             */
/*   Updated: 2017/03/06 15:05:24 by aiwanesk         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "cpu.h"

void				apply_live(t_process *process,
		unsigned char memory[MEM_SIZE], t_env *env)
{
	int		i;
	int		total;

	i = 0;
	total = 0;
	while (i < 4)
	{
		total += memory[process->pc + i];
		i++;
	}
	//TODO c'est ca que tu veux?
	i = 0;
	while (i < 255)
	{
		if (i == total)
		{
			env->process[i].alive++;
			break;
		}
		i++;
	}
	process->pc = (process->pc + i) % MEM_SIZE;
}