import React from 'react';

/** Status normalizado usado só na UI */
export type NormalStatus =
    | 'pending'
    | 'preparing'
    | 'out_for_delivery'
    | 'completed'
    | 'canceled';

/** Rótulos em PT-BR para a UI */
export const STATUS_LABEL: Record<NormalStatus, string> = {
    pending: 'Pendente',
    preparing: 'Preparando',
    out_for_delivery: 'Saiu para entrega',
    completed: 'Entregue',
    canceled: 'Cancelado',
};

/** ✅ Alvos (em PT-BR) que vamos gravar no banco SEMPRE */
export const DB_TARGET: Record<NormalStatus, string> = {
    pending: 'pendente',
    preparing: 'preparando',
    out_for_delivery: 'saiu_entrega',
    completed: 'entregue',
    canceled: 'cancelado',
};

/** Todas as variações que podem existir no banco para cada status */
const DB_ALIASES: Record<NormalStatus, string[]> = {
    pending: ['PENDING', 'pending', 'pendente', 'confirmed', 'CONFIRMED'], // se aparecer "confirmed", normalizamos pra pending
    preparing: ['PREPARING', 'preparing', 'preparando'],
    out_for_delivery: ['OUT_FOR_DELIVERY', 'out_for_delivery', 'DELIVERING', 'delivering', 'saiu_entrega'],
    completed: ['COMPLETED', 'completed', 'DELIVERED', 'delivered', 'entregue'],
    canceled: ['CANCELED', 'canceled', 'CANCELLED', 'cancelled', 'cancelado'],
};

/** Valores suportados para .in('status', [...]) */
export const DB_SUPPORTED_VALUES: string[] = Array.from(
    new Set(Object.values(DB_ALIASES).flat())
);

/** Banco -> normalizado */
export function fromDbStatus(value: string): NormalStatus {
    const v = (value || '').trim();
    for (const key of Object.keys(DB_ALIASES) as NormalStatus[]) {
        if (DB_ALIASES[key].includes(v)) return key;
    }
    return 'pending';
}

/** Normalizado -> valor em PT-BR para gravar no banco */
export function toDbStatus(n: NormalStatus): string {
    return DB_TARGET[n];
}

/** Badge */
export function StatusBadge({ status }: { status: NormalStatus }) {
    const cls: Record<NormalStatus, string> = {
        pending: 'bg-yellow-500/15 text-yellow-700',
        preparing: 'bg-blue-500/15 text-blue-700',
        out_for_delivery: 'bg-purple-500/15 text-purple-700',
        completed: 'bg-green-500/15 text-green-700',
        canceled: 'bg-red-500/15 text-red-600',
    };
    return (
        <span className={`inline-flex items-center px-2 py-0.5 rounded-full text-xs font-medium ${cls[status]}`}>
            {STATUS_LABEL[status]}
        </span>
    );
}
