export const Config = {
  regions: {
    main: { name: "Main", address: "suroi-1.gopubby.com", https: true },
    savannah: { name: "Savannah", address: "suroi-2.gopubby.com", https: true },
    docks: { name: "Docks", address: "suroi-3.gopubby.com", https: true },
  },
  defaultRegion: "main",
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
