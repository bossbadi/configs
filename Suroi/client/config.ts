export const Config = {
  regions: {
    1: { name: "Downtown", address: "suroi-1.gopubby.com", https: true },
    2: { name: "Sniper's Lair", address: "suroi-2.gopubby.com", https: true },
    3: { name: "Ricochet Arena", address: "suroi-3.gopubby.com", https: true },
  },
  defaultRegion: "1",
  mode: "normal",
} satisfies ConfigType as ConfigType;

export interface ConfigType {
  readonly regions: Record<
    string,
    {
      readonly name: string;
      readonly address: string;
      readonly https: boolean;
    }
  >;
  readonly defaultRegion: string;
  readonly mode: string;
}
